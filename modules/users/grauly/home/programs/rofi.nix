{ pkgs, pkgs-unstable, ... }:

{
  #TODO get calc running
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
    extraConfig = {
      modes = "window,drun,run,ssh,calc,emoji";
    };
    theme = ./rofi-theme.rasi;
  };
}
