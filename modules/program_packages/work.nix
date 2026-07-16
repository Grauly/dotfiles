{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser
    ../programs/matlab.nix
  ];

  environment.systemPackages = with pkgs; [
    thunderbird
    libreoffice-qt
    zoom-us
    #bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
