{ pkgs, pkgs-unstable, ... }:

{
  # anything usefull for use with actual file explorers
  # note that the actual file browsers are on system level
  imports = [
    ./core_utils.nix
  ];

  home.packages = with pkgs; [
    evince
    eog
    zip
    vlc
    libsForQt5.ark
  ];
}
