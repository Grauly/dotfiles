{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser
  ];

  environment.systemPackages = with pkgs; [
    thunderbird
    libreoffice-qt
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
