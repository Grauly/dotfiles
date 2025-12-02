{ pkgs, pkgs-unstable, config, ... }:


{
  imports = [
    ../../qalc
  ];
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];
    extraConfig = {
      modes = "window,drun,run,ssh,calc,emoji";
    };
    theme = builtins.toString (import ./rofi-theme.rasi.nix { inherit pkgs config; });
  };
}
