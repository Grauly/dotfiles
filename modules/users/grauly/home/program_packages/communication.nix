{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/browser.nix
    ../programs/kde_connect.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    element-desktop
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    vesktop
  ]);
}
