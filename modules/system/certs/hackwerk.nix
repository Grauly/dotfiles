{ pkgs, pkgs-unstable, config, ... }:

let 
  hw-domainsuffix = {
    "browser.fixup.domainsuffixwhitelist.hackwerk" = true;
  };
in {
  security.pki.certificateFiles = [
    ./hackwerk.pem
  ];

  programs.firefox.preferences = config.programs.firefox.preferences ++ hw-domainsuffix;
}