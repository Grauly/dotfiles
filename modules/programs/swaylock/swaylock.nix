{ pkgs, osConfig, ... }:

{
  programs.swaylock = with osConfig.grauly; {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = (import ./lockscreen_1.nix { inherit colors; });
  };
}
