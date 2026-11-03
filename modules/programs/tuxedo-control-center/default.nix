{ pkgs, ... }:

let
  pkgVersion = "3.1.1";
in pkgs.buildNpmPackage {
  pname = "tuxedo-control-center";
  version = pkgVersion;

  src = pkgs.fetchFromGitHub {
    owner = "tuxedocomputers";
    repo = "tuxedo-control-center";
    tag = "v${pkgVersion}";
    hash = "sha256-WKJFyqH7kc2eW1Ung7YY1H1kQ7gR6Wko3QsUN1PpkFo=";
  };

  npmDepsHash = "sha256-+kLQ5g64WshN73RtpOyqqTQyMUnM7zKR15PPeyV+6WA=";
  makeCacheWritable = true;

  ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
  
  
}