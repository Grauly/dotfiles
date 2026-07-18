{ pkgs, config, ... }:


{
  hardware = {
    tuxedo-drivers.enable = true;
    tuxedo-control-center.enable = true;
  };
}