{ pkgs, ... }:

[
  { # background
    argv = ["${pkgs.lib.getExe pkgs.swaybg}" "-i" "${../../assets/backgrounds/eDP-1/_default.png}"];
  }
]