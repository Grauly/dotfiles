{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./core_utils.nix
    ../programs/gimp.nix
    ../programs/blender.nix
  ];

  home.packages = with pkgs; [
    godot
  ];
}