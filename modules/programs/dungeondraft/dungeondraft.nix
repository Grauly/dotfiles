{
  lib,
  stdenv,
  requireFile,
  unzip,
  autoPatchelfHook,
  makeWrapper,

  libGL,
  krb5,
  zlib,
  libx11,
  libxcursor,
  libxext,
  libxi,
  libxinerama,
  libxrandr,
  libxrender,

  # dlopen'd at runtime, missed by autoPatchelfHook
  alsa-lib,
  libpulseaudio,
  udev,

  # exec'd child processes (file pickers, ShellOpen)
  zenity,
  xdg-utils,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "dungeondraft";
  version = "1.2.0.1";

  src = requireFile {
    name = "Dungeondraft-${finalAttrs.version}-Linux64.zip";
    url = "https://dungeondraft.net/";
    sha256 = "09n02j9hnl89dnv3paz5cfzhplzcgmami7lqwa3aswcjfpnm1hs8";
    message = ''
      Dungeondraft is paid software, so its zip needs to be provided by you.
      Buy and download it from https://dungeondraft.net/, then add it to the
      Nix store with:

      nix-store --add-fixed sha256 ./Dungeondraft-${finalAttrs.version}-Linux64.zip

      Then rebuild your system configuration.
    '';
  };

  nativeBuildInputs = [
    unzip
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    libGL
    krb5
    zlib
    libx11
    libxcursor
    libxext
    libxi
    libxinerama
    libxrandr
    libxrender
  ];

  sourceRoot = ".";

  runtimeDependencies = [
    alsa-lib
    libpulseaudio
    udev
  ];

  installPhase = ''
    runHook preInstall

    install -d $out/share/dungeondraft
    cp -r data_Dungeondraft mods translations $out/share/dungeondraft/
    cp Dungeondraft.pck Dungeondraft.x86_64 EULA.txt example_template.zip \
      $out/share/dungeondraft/
    chmod +x $out/share/dungeondraft/Dungeondraft.x86_64

    # work around relative resolve of data_Dungeondraft
    makeWrapper $out/share/dungeondraft/Dungeondraft.x86_64 $out/bin/dungeondraft \
      --prefix PATH : "${lib.makeBinPath [ zenity xdg-utils ]}"

    install -Dm444 Dungeondraft.png \
      $out/share/icons/hicolor/256x256/apps/dungeondraft.png

    install -Dm444 Dungeondraft.desktop $out/share/applications/dungeondraft.desktop
    substituteInPlace $out/share/applications/dungeondraft.desktop \
      --replace-fail "Exec=/opt/Dungeondraft/Dungeondraft.x86_64" "Exec=dungeondraft" \
      --replace-fail "Icon=/opt/Dungeondraft/Dungeondraft.png" "Icon=dungeondraft" \
      --replace-fail "Path=/opt/Dungeondraft" "Path=$out/share/dungeondraft"
    # upstream misuses desktop-entry-spec version as app version
    sed -i '/^Version=/d' $out/share/applications/dungeondraft.desktop

    runHook postInstall
  '';

  meta = {
    description = "Tabletop encounter map creation tool";
    homepage = "https://dungeondraft.net/";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
    mainProgram = "dungeondraft";
  };
})