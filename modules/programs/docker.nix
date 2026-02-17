{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };
  users.users.grauly.extraGroups = ["docker"];
}