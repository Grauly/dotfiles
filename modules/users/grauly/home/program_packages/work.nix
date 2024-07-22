{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    firefox
    thunderbird
    libreoffice-qt
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    bitwarden-desktop
  ]);
}
