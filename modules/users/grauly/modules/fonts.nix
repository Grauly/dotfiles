{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    atkinson-hyperlegible
  ];
}
