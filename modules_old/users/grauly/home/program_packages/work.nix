{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    libreoffice-qt
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
