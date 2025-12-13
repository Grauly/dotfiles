{ pkgs, osConfig, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = (import ./waybar_settings.nix { inherit pkgs osConfig; });
    };
    style = ./waybar_style.css;
  };
}
