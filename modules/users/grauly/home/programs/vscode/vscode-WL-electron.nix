{ pkgs, ... }:

pkgs.symlinkJoin {
  name = "vscode-electron";
  pname = pkgs.vscode.pname;
  version = pkgs.vscode.version;
  paths = [ pkgs.vscode ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/code --set NIXOS_OZONE_WL 1
  '';
}