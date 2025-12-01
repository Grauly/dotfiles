{ pkgs, ... }:

{
  environment.systemPackages = [
    top
    htop
    btop

    fastfetch
  ];
}