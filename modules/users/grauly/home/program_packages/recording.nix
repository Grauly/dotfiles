{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/obs.nix
  ];

  home.packages = with pkgs; [
    audacity
  ];
}
