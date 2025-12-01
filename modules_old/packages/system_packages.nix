{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    btop
    unzip
    usbutils
    pciutils
    lshw
    util-linux
    dmidecode
    gptfdisk
    dnsutils
  ];
}
