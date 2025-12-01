{ stdenv
, autoPatchelfHook
, cups
, dpkg
}:

stdenv.mkDerivation rec {
  name = "pebble4-${version}";
  version = "1.0";

  src = builtins.fetchurl {
    url = "https://s3.sfz-aalen.space/static/hackwerk/evolisprinter-4.12.8.8.amd64.deb";
    sha256 = "sha256:1iy7dlfg1qs6nrgqan2xf95m2yd2p8289fnv98f457kfs69l0my6";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
  ];

  buildInputs = [
    cups
  ];

  unpackPhase = "dpkg-deb -x $src $out";

  installPhase = ''
    mv $out/usr/share $out/
    mv $out/usr/lib $out/
    rm -rf $out/usr
  '';
}
