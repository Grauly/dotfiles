{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      exec kitty -- "$@"
    '')
  ];
}
