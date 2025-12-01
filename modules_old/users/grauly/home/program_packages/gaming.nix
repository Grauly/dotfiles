{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/rofi.nix
    ../programs/flameshot.nix
    ../programs/prismlauncher.nix
  ];

  home.packages = with pkgs; [
    mangohud
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
