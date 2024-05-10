{ pkgs, pkgs-unstable, ... }:

{
  #TODO get calc running
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-calc
    ];
  };
}
