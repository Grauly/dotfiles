{ pkgs, pkgs-unstable, home-manager, ... }:

{
  home-manager.users.grauly = {
    programs.vesktop = {
      enable = true;
    };
  };
}