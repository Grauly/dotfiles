{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    btop
    zsh
    unzip
    usbutils
  ];
}
