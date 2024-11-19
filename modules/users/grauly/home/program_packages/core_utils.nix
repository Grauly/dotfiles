{ pkgs, pkgs-unstable, ... }:

{
  # The things I need at minimum to continue editing this config
  imports = [
    ../programs/git.nix
    ../programs/neovim.nix
    ../programs/rofi.nix
    ../programs/kitty.nix
    ../programs/zsh.nix
    ../programs/vscode.nix
    ../programs/ssh.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt # required by vscode addon
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
  ];
}
