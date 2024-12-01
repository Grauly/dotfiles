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
      (rofi-calc.overrideAttrs {rofi-unwrapped = rofi-wayland-unwrapped;})
      (rofi-emoji.overrideAttrs {rofi-unwrapped = rofi-wayland-unwrapped;})
    ];
    extraConfig = {
      modes = "window,drun,run,ssh,calc,emoji";
    };
    theme = builtins.toString (import ./rofi-theme.rasi.nix { inherit pkgs osConfig; });
  };
}
