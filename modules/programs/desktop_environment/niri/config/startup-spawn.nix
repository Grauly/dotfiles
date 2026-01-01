{ pkgs, ... }:

[
  { # background
    argv = ["${pkgs.lib.getExe pkgs.swaybg}" "-i" "${../../assets/background.png}"];
  }
]