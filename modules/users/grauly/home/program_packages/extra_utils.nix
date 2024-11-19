{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    xorg.xev
    tree
    killall
    cryfs
    fzf
  ];
}
