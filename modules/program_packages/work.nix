{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser
  ];

  home.packages = with pkgs; [
    thunderbird
    libreoffice-qt
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
