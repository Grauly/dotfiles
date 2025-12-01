{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/blender.nix
    ../programs/inkscape.nix
    ../programs/flameshot.nix
    ../programs/gimp.nix
  ];

  environment.systemPackages = with pkgs; [
    audacity
    imagemagick
    icoutils
    qrencode
  ] ++ (with pkgs-unstable; [
    prusa-slicer
  ]);
}
