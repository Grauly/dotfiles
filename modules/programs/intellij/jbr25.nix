{ pkgs, 
  debugBuild ? false,
  withJcef ? true,
  ...
}:

# stolen and adapted from: https://github.com/NixOS/nixpkgs/blob/nixos-25.11/pkgs/development/compilers/jetbrains-jdk/default.nix
let
  arch =
    {
      "aarch64-linux" = "aarch64";
      "x86_64-linux" = "x64";
    }
    .${pkgs.stdenv.hostPlatform.system} or (throw "Unsupported system: ${pkgs.stdenv.hostPlatform.system}");
  cpu = pkgs.stdenv.hostPlatform.parsed.cpu.name;
in
pkgs.jdk21.overrideAttrs (newAttrs: oldAttrs: rec {
  pname = "jetbrains-jdk" + pkgs.lib.optionalString withJcef "-jcef";
  javaVersion = "25.0.1";
  build = "285.56";
  openjdkTag = "jbr-release-25.0.1b285.56";
  version = "${javaVersion}-b${build}";

    src = pkgs.fetchFromGitHub {
      owner = "JetBrains";
      repo = "JetBrainsRuntime";
      tag = openjdkTag;
      hash = "sha256-P2boCbGB66X8LB4sZHGFO8lqHbv6F4kqGVMGBd9yKu0=";
    };

  env = (oldAttrs.env or { }) // {
    BOOT_JDK = pkgs.jdk21.home;
    # run `git log -1 --pretty=%ct` in jdk repo for new value on update
    SOURCE_DATE_EPOCH = 1769824992;
  };

  patches = [ ];

  dontConfigure = true;

  configureFlags = (pkgs.lib.lists.remove "--with-vendor-version-string=(nix)" oldAttrs.configureFlags) ++ [ "--with-vendor-version-string=nix" ];

  buildPhase = ''
    runHook preBuild

    ${pkgs.lib.optionalString withJcef "cp -r ${pkgs.jetbrains.jcef} jcef_linux_${arch}"}

    sed \
        -e "s/OPENJDK_TAG=.*/OPENJDK_TAG=${openjdkTag}/" \
        -e "s/SOURCE_DATE_EPOCH=.*//" \
        -e "s/export SOURCE_DATE_EPOCH//" \
        -i jb/project/tools/common/scripts/common.sh
    declare -a realConfigureFlags
    for configureFlag in "''${configureFlags[@]}"; do
      case "$configureFlag" in
        --host=*)
          # intentionally omit flag
          ;;
        *)
          realConfigureFlags+=("$configureFlag")
          ;;
      esac
    done
    echo "computed configure flags: ''${realConfigureFlags[*]}"
    substituteInPlace jb/project/tools/linux/scripts/mkimages_${arch}.sh --replace-fail "STATIC_CONF_ARGS" "STATIC_CONF_ARGS ''${realConfigureFlags[*]}"
    sed \
        -e "s/create_image_bundle \"jb/#/" \
        -e "s/echo Creating /exit 0 #/" \
        -i jb/project/tools/linux/scripts/mkimages_${arch}.sh

    patchShebangs .
    echo "-------------------"
    cat ./jb/project/tools/linux/scripts/mkimages_${arch}.sh
    echo "-------------------"
    ./jb/project/tools/linux/scripts/mkimages_${arch}.sh ${build} ${
      if debugBuild then "fd" else (if withJcef then "jcef" else "nomod")
    }

    runHook postBuild
  '';

  installPhase =
    let
      buildType = if debugBuild then "fastdebug" else "release";
      debugSuffix = if debugBuild then "-fastdebug" else "";
      jcefSuffix = if debugBuild || !withJcef then "" else "_jcef";
      jbrsdkDir = "jbrsdk${jcefSuffix}-${javaVersion}-linux-${arch}${debugSuffix}-b${build}";
    in
    ''
      runHook preInstall

      mv build/linux-${cpu}-server-${buildType}/images/jdk/man build/linux-${cpu}-server-${buildType}/images/${jbrsdkDir}
      rm -rf build/linux-${cpu}-server-${buildType}/images/jdk
      mv build/linux-${cpu}-server-${buildType}/images/${jbrsdkDir} build/linux-${cpu}-server-${buildType}/images/jdk
    ''
    + oldAttrs.installPhase
    + "runHook postInstall";

  postInstall = pkgs.lib.optionalString withJcef ''
    chmod +x $out/lib/openjdk/lib/chrome-sandbox
  '';

  dontStrip = debugBuild;

  postFixup = ''
    # Build the set of output library directories to rpath against
    echo "Entered postFixup"
    LIBDIRS="${
      pkgs.lib.makeLibraryPath (with pkgs; [
        libxdamage
        libxxf86vm
        libxrandr
        libxi
        libxcursor
        libxrender
        libx11
        libxext
        libxkbcommon
        libxcb
        nss
        nspr
        libdrm
        libgbm
        wayland
        udev
        fontconfig
      ])
    }"
    for output in ${pkgs.lib.concatStringsSep " " oldAttrs.outputs}; do
      if [ "$output" = debug ]; then continue; fi
      LIBDIRS="$(find $(eval echo \$$output) -name \*.so\* -exec dirname {} \+ | sort -u | tr '\n' ':'):$LIBDIRS"
    done
    # Add the local library paths to remove dependencies on the bootstrap
    for output in ${pkgs.lib.concatStringsSep " " oldAttrs.outputs}; do
      if [ "$output" = debug ]; then continue; fi
      OUTPUTDIR=$(eval echo \$$output)
      BINLIBS=$(find -L $OUTPUTDIR/bin -type f; find $OUTPUTDIR -name \*.so\*)
      echo "$BINLIBS" | while read i; do
        patchelf --set-rpath "$LIBDIRS:$(patchelf --print-rpath "$i")" "$i" || true
      done
    done
    ls -lah
    tree -L 3
  '';

  nativeBuildInputs = with pkgs; [
    git
    autoconf
    unzip
    rsync
    shaderc # glslc
    tree
  ]
  ++ oldAttrs.nativeBuildInputs;

  buildInputs = with pkgs; [
    vulkan-headers
  ]
  ++ oldAttrs.buildInputs or [ ];

  passthru = oldAttrs.passthru // {
    home = "${pkgs.jdk25}/lib/openjdk";
  };
})