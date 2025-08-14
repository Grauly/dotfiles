{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    btop
    zsh
    unzip
    usbutils
    pciutils
    lshw
    util-linux
    dmidecode
    neovim
    gptfdisk
    dnsutils
  ];
}
