{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    swaybg
  ];
}