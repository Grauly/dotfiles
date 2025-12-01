{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    texstudio
    texliveFull
  ];
}
