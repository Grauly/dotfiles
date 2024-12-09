{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/firefox.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    libreoffice-qt
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
