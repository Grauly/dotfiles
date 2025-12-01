{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/obs.nix
  ];

  environment.systemPackages = with pkgs; [
    audacity
  ];
}
