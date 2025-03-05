{ pkgs, ... }:
let
  # lifted from: https://github.com/NixOS/nixpkgs/blob/6af28b834daca767a7ef99f8a7defa957d0ade6f/pkgs/applications/networking/browsers/firefox/wrapper.nix#L217
  baseConfig = rec {
    exec = "${pkgs.librewolf}/bin/librewolf";
    type = "Application";
    categories = [ "Network" "WebBrowser" ];
    mimeType = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "application/vnd.mozilla.xul+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
    actions = {
      new-window = {
        name = "New Window";
        exec = "${exec} --new-window %U";
      };
      new-private-window = {
        name = "New Private Window";
        exec = "${exec} --private-window %U";
      };
      profile-manager-window = {
        name = "Profile Manager";
        exec = "${exec} --ProfileManager";
      };
    };
  };
in
{
  xdg.desktopEntries."Firefox" = {
    name = "Firefox";
    genericName = "Web Browser, Actually LibreWolf in disguise";
  } // baseConfig;
  xdg.desktopEntries."LibreWolf" = {
    name = "LibreWolf";
    genericName = "Web Browser";
  } // baseConfig;
}
