{ pkgs, ... }:

{
  programs.niri.enable = true;
  home-manager.users.grauly.xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}