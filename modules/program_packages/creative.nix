{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/blender.nix
    ../programs/inkscape.nix
    ../programs/flameshot.nix
    ../programs/gimp.nix
  ];

  home.packages = with pkgs; [
    audacity
    imagemagick
    icoutils
    qrencode
  ] ++ (with pkgs-unstable; [
    prusa-slicer
  ]);
}
