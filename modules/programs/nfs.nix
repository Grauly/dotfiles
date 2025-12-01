{ pkgs, ... }:
{
  services.rpcbind.enable = true;
  boot.initrd = {
    supportedFilesystems = [ "nfs" ];
    kernelModules = [ "nfs" ];
  };

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
}
