{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd = {
    supportedFilesystems =  [ "nfs" ];
    kernelModules = [ "nfs" ];
  };
}
