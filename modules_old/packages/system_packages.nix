{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    btop
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
