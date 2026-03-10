{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/application_launcher
    ../programs/flameshot.nix
    ../programs/prismlauncher.nix
    ../programs/steam.nix
  ];

  environment.systemPackages = with pkgs; [
    mangohud
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
