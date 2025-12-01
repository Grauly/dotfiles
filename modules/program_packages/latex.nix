{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    texstudio
    texliveFull
  ];
}
