{
pkgs,
requireFile,
stdenv,
autoPatchelfHook,
lib,
...
}:
stdenv.mkDerivation rec {
  pname = "evolisprinter";
  version = "4.12.8.8";

  src = requireFile rec {
    name = "evolisprinter-${version}.amd64.deb";
    sha256 = "1iy7dlfg1qs6nrgqan2xf95m2yd2p8289fnv98f457kfs69l0my6";

    message = ''
      In order to use Evolis printer drivers, you need to and get the
      the binary, ${name} yourself from https://myplace.evolis.com/s/product/tattoo-2/01t5p00000CXScTAAX

      Once you have got the file, please use the following command and re-run the
      installation:

      nix-prefetch-url file://\$PWD/${name}
    '';
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    dpkg
    makeWrapper
    cups
  ];
  
  unpackPhase = ''
    dpkg-deb -x $src $out/
    '';

  installPhase = ''
      find $out/
      mkdir -p $out/lib/cups/filter
      mkdir -p $out/share/cups/model
      mv $out/usr/lib/cups/filter/rastertoevolis $out/lib/cups/filter/
      mv $out/usr/share/cups/model/*.ppd.gz $out/share/cups/model/
      rm -rf $out/usr/
    '';

  meta = {
    description = "Evolis drivers for Tattoo 2 printer";
    downloadPage = "https://myplace.evolis.com/s/product/tattoo-2/01t5p00000CXScTAAX";
    #license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [
      "x86_64-linux"
    ];
  };
}