{ pkgs, pkgs-unstable, osConfig, ... }:


let
  #see https://github.com/NixOS/nixpkgs/issues/298539
  override = package: (
    (package.override {
      rofi-unwrapped = pkgs.rofi-wayland-unwrapped;
    })
  );
  plugins = with pkgs; [
    (override rofi-calc)
    (override rofi-emoji)
  ];
in
{
  imports = [
    ./qalc.nix
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland.override {
      inherit plugins;
    };
    terminal = "${pkgs.kitty}/bin/kitty";
    inherit plugins;
    extraConfig = {
      modes = "window,drun,run,ssh,calc,emoji";
    };
    theme = builtins.toString (import ./rofi-theme.rasi.nix { inherit pkgs osConfig; });
  };
}
