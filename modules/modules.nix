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
    ./gtk.nix
    ./thunar.nix
    ./nautilus.nix
    ./kde_connect.nix
    ./platformio.nix
    ./mindustry.nix
    ./xdg-terminal-workaround.nix
    ./tlp.nix
    ./rpi_setup.nix
  ];
}
