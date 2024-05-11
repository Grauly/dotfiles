{
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0x0483", ATTRS{idProduct}=="0x5740", MODE="0666"
  '';
}