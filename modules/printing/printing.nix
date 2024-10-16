{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.hplip
      ((pkgs.callPackage ./dcp9022cdw {}).driver)
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
      model = "brother_dcp9022cdw_printer_en.ppd";
      deviceUri = "socket://192.168.11.29";
    }
  ];
}
