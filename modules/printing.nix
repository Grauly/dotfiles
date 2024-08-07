{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };
  hardware.printers.ensurePrinters = [{
    name = "Space-2d-Drucker";
    model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
    deviceUri = "socket://2d.sfz-aalen.space";
  }];
}
