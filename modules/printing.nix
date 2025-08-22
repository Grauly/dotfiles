{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
      #(pkgs.callPackage ./printer_drivers/pebble.nix {})
    ];
    logLevel = "debug";
  };
  hardware.printers.ensurePrinters = [
    {
      name = "Space-2d-Drucker";
      model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
      deviceUri = "socket://10.11.42.10";
    }
    {
      name = "Home-2d-Drucker";
      # dirty hack, but works, for some reason.
      model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
      deviceUri = "ipp://192.168.178.22";
    }
#    {
#      name = "Pebble4";
#      model = "evolis-pebbleE.ppd.gz";
#      deviceUri = "usb://EVOLIS/Pebble";
#    }
  ];
}
