{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/gimp.nix
    ../programs/blender.nix
  ];

  environment.systemPackages = with pkgs; [
    godotPackages_4_5.godot
  ];
}
