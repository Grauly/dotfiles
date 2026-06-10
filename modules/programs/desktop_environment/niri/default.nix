{ pkgs, niri, ... }:

{
  imports = [
    ./autostart.nix
  ];
  
  home-manager.users.grauly = {
    imports = [
      ./config
      niri.homeModules.niri
    ];
  };
  
  xdg.portal = {
    enable = true;
    config.common.default = [ "gnome" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}