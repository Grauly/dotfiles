{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/blender.nix
    ../programs/inkscape.nix
    ../programs/flameshot.nix
    ../programs/gimp.nix
    ../programs/dungeondraft
  ];

  environment.systemPackages = with pkgs; [
    audacity
    imagemagick
    icoutils
    qrencode
    aseprite
    dune3d
  ] ++ (with pkgs-unstable; [
    prusa-slicer
  ]);
}
