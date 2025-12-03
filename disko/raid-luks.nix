{ lib, ... }:
{
  disko.devices.disk = {
    disk1 = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02"; # for grub MBR
          };
          ESP = {
            size = "500M";
            type = "EF00";
            content = {
              type = "mdraid";
              name = "boot";
            };
          };
          mdadm = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "raid0";
            };
          };
        };
      };
    };
    disk2 = {
      type = "disk";
      device = "/dev/nvme1n1";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02"; # for grub MBR
          };
          ESP = {
            size = "500M";
            type = "EF00";
            content = {
              type = "mdraid";
              name = "boot";
            };
          };
          mdadm = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "raid0";
            };
          };
        };
      };
    };
  };
  disko.devices.mdadm = {
    boot = {
      type = "mdadm";
      level = 0;
      metadata = "1.0";
      content = {
        type = "filesystem";
        format = "vfat";
        mountpoint = "/boot";
        mountOptions = [ "umask=0077" ];
      };
    };
    raid0 = {
      type = "mdadm";
      level = 0;
      content = {
        type = "luks";
        name = "crypted";
        content = {
          type = "filesystem";
          format = "ext4";
          mountpoint = "/";
        };
      };
    };
  };
}

