{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    atkinson-hyperlegible
    nerd-fonts.jetbrains-mono
  ];
}
