{ pkgs, pkgs-unstable, ... }:

{
  # The things I need at minimum to continue editing this config
  imports = [
    ../programs/git.nix
    ../programs/neovim.nix
    ../programs/rofi.nix
    ../programs/alacritty.nix
    ../programs/zsh.nix
    ../programs/vscode.nix
    ../programs/ssh.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt # required by vscode addon
    libsForQt5.konsole # required by tmux (dont ask)
  ];

  programs.vscode.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
  ];
}
