{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = (import ./waybar_settings.nix {inherit pkgs;});
    };
  };
}
