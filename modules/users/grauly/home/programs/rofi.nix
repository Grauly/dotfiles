{ pkgs, pkgs-unstable, osConfig, ... }:


{
  imports = [
    ./qalc.nix
  ];
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
    theme = builtins.toString (import ./rofi-theme.rasi.nix { inherit pkgs osConfig; });
  };
}
