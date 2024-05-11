{
  imports = [
    ./boot.nix
    ./nix.nix
    ./network.nix
		./locale.nix
		./desktop/desktops.nix
		./printing.nix
		./users.nix
		./packages/system_packages.nix
    ./disks.nix
    ./udev.nix
  ];
}
