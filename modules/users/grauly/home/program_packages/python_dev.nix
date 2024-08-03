{ pkgs, pkgs-unstable, ... }:

{ 
  imports = [
    ./core_utils.nix
  ];
  #No actual python env set up, this should be done via flakes on location

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extension; [
      ms-python.vscode-pylance
      ms-python.python
      ms-python.debugpy
      ms-python.black-formatter
    ];
  };
}
