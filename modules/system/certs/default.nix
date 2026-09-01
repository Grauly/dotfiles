{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./hackwerk.nix
  ];
  
  environment.systemPackages = with pkgs; [
    p11-kit
  ];
}