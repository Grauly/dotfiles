{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "pkg-trace";
  text = ''
    readlink -f "$(which "$1")"
  '';
}