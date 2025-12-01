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
    libsForQt5.ark
    mount
    openmpi
    ior
  ];
}
