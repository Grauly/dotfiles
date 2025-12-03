{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    top
    htop
    btop

    fastfetch
  ];
}
