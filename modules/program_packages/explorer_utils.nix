{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/file_explorer
    ../programs/udisks.nix
  ];

  environment.systemPackages = with pkgs; [
    evince
    eog
    zip
    vlc
    kdePackages.ark
    mount
    openmpi
    ior
    ncdu
    smartmontools
  ];
}
