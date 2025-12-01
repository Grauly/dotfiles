{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/gimp.nix
    ../programs/blender.nix
  ];

  environment.systemPackges = with pkgs; [
    godotPackages_4_5.godot
  ];
}
