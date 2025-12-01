{ pkgs, ... }:

pkgs.writeShellScriptBin {
  name = "xdg-terminal-exec";
  text = ''
    exec kitty -- "$@"
  '';
}
