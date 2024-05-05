{ pkgs, pkgs-unstable, ... }:

{
  #programs.kdeconnect = {
  #  enable = true;
  #  package = pkgs-unstable.kdePackages.kdeconnect-kde;
  #};
  programs.zsh.enable = true;
  programs.steam.enable = true;
  users.users.grauly.packages = with pkgs; [
    #effectivly useless if you have a home-manager running
  ];
}
