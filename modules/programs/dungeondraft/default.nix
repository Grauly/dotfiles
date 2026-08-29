{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    (pkgs.callPackage ./dungeondraft.nix {})
  ];
}