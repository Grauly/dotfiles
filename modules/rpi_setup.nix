{ config, ...}:

{
  # https://github.com/rubenhoenle/pi-nixos
  boot.binfmt.emulatedSystems = [ "armv6l-linux" ];
  nix.settings.extra-platforms = config.boot.binfmt.emulatedSystems;
}
