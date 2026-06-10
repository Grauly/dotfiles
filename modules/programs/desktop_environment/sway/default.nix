{ pkgs, home-manager, ... }:

{
  home-manager.users.grauly = (import ./sway_home.nix);
  imports = [
    ./wayland-sway.nix
  ];
  
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    wlr.enable = true;
  };
}