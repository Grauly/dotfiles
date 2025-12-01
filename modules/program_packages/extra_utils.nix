{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    xorg.xev
    tree
    killall
    cryfs
    fzf
    ripgrep
    nmap
  ];
}
