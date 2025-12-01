{ pkgs, ... }:

{
  home-manager.users.grauly.programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = (import ./waybar_settings.nix { inherit pkgs; });
    };
    style = ./waybar_style.css;
  };
}
