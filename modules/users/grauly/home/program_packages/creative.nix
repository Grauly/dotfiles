{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/blender.nix
    ../programs/inkscape.nix
    ../programs/flameshot.nix
  ];

  home.packages = with pkgs; [
    gimp
    audacity
    imagemagick
    icoutils
    qrencode
  ] ++ (with pkgs-unstable; [
    prusa-slicer
  ]);
}
