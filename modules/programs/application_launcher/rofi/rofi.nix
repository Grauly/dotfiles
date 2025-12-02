{ pkgs, pkgs-unstable, config, ... }:


{
  imports = [
    /modules/programs/qalc
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      (rofi-calc.override { rofi-unwrapped = rofi-wayland-unwrapped; })
      rofi-emoji-wayland
    ];
    extraConfig = {
      modes = "window,drun,run,ssh,calc,emoji";
    };
    theme = builtins.toString (import ./rofi-theme.rasi.nix { inherit pkgs config; });
  };
}
