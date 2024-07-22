{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    firefox
    thunderbird
    element-desktop
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    bitwarden-desktop
    vesktop
  ]);
}
