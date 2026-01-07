{ pkgs, ... }:

[
  #{ # background
  #  argv = ["${pkgs.lib.getExe pkgs.swaybg}" "-i" "${../../assets/background.png}"];
  #}
  {
    argv = ["multibg-wayland" "${../../assets/backgrounds}" ];
  }
]