{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser
    #../programs/matlab.nix
    ../programs/ollama.nix
  ];

  environment.systemPackages = with pkgs; [
    thunderbird
    libreoffice-qt
    devenv
    #bitwarden-desktop
  ] ++ (with pkgs-unstable; [
    zoom-us
  ]);
}
