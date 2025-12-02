{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/file_explorer
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
  ];
}
