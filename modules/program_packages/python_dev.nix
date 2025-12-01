{ pkgs, pkgs-unstable, ... }:

{
  imports = [
  ];
  #No actual python env set up, this should be done via flakes on location

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    ms-python.vscode-pylance
    ms-python.python
    ms-python.debugpy
    ms-python.black-formatter
  ];
}
