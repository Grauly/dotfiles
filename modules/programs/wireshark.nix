{ pkgs, ... }:

{
  programs.wireshark.enable = true;
  users.users.grauly.extraGroups = [ "wireshark" ];
  environment.systemPackages = [
    pkgs.wireshark
  ];
}