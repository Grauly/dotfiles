{ home-manager, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./gtk
  ];

  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" "lp" ];
  };

  home-manager.users.grauly = {
    home.stateVersion = "24.11";
    home.username = "grauly";
    home.homeDirectory = "/home/grauly";

    programs.home-manager.enable = true;
  };
}
