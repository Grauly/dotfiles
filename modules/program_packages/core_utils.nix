{ pkgs, pkgs-unstable, ... }:

{
  # The things I need at minimum to continue editing this config
  imports = [
    ../programs/git.nix
    ../programs/neovim.nix
    ../programs/application_launcher
    ../programs/terminal
    ../programs/shell
    ../programs/vscode
    ../programs/ssh.nix
    ../programs/ssh_server.nix
    ../programs/tailscale.nix
  ];
}
