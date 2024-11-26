{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/firefox.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    libreoffice-qt
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    bitwarden-desktop
  ]);
}
