{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/system_information.nix
    ../programs/printing.nix
  ];
  
  environment.systemPackages = with pkgs; [
    pavucontrol
    xorg.xev
    tree
    killall
    cryfs
    fzf
    ripgrep
    nmap
    systemctl-tui
  ];
}
