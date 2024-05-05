{
  home.shellAliases = {
    ll = "ls - lah";
    lsstick = "lsblk | grep -v  \"nvme\"";
    mntstick = "udisksctl mount -b /dev/";
    umntstick = "udisksctl unmount -b /dev/";
    reswitch = "sudo nixos-rebuild switch --flake /home/grauly/dotfiles#thetanix";
    reswitch-boot = "sudo nixos-rebuild boot --flake /home/grauly/dotfiles#thetanix";
  };
}
