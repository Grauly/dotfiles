{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
    ];
    logLevel = "debug";
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Space-2d-Drucker";
      model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
      deviceUri = "socket://2d.sfz-aalen.space";
    }
    {
      name = "Home-2d-Drucker";
      # dirty hack, but works, for some reason.
      model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
      deviceUri = "ipp://192.168.11.29";
    }
  ];
}
