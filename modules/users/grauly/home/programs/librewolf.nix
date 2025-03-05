{ pkgs, ... }:

{
  xdg.desktopEntries."Firefox" = {
    name = "Firefox";
    genericName = "Web Browser, Actually LibreWolf in disguise";
    exec = "${pkgs.librewolf}/bin/librewolf";
    type = "Application";
  };
  xdg.desktopEntries."LibreWolf" = {
    name = "LibreWolf";
    genericName = "Web Browser";
    exec = "${pkgs.librewolf}/bin/librewolf";
    type = "Application";
  };
}