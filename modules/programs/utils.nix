{ pkgs, ... }:

{
  # This has a very broad mandate: be everything I cannot figure out where to better put.
  # Must only be cli applications
  environment.systemPackages = with pkgs; [
    unzip
    usbutils
    pciutils
    lshw
    util-linux
    dmidecode
    gptfdisk
  ];
}