{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/rofi.nix
    ../programs/flameshot.nix
  ];

  home.packages = with pkgs; [
    mangohud
    prismlauncher
    #steam, but that is fucky around the edges and needs to be installed system wide
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
