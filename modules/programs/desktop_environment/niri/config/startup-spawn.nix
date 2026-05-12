{ pkgs, ... }:

[
  { # background
    argv = ["${pkgs.lib.getExe (import ../../../swaybg.nix { inherit pkgs; })}" "-i" "${../../assets/backgrounds/eDP-1/_default.png}"];
  }
  { # backdrop
    argv = ["${pkgs.lib.getExe (import ../../../swaybg.nix { inherit pkgs; })}" "-i" "${../../assets/backdrop.png}" "-n" "backdrop"];
  }
]