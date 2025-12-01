{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    wget
    curl
    dnsutils
  ];

  networking.hostName = "THETAPRIME"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "GPN" = {
      connection = {
        id = "GPN";
        type = "wifi";
        autoconnect = true;
        interface-name = "wlp4s0";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "GPN";
      };
      wifi-security = {
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "ttls;";
        identity = "gpn";
        password = "gpn";
        phase2-auth = "pap";
        domain-suffix-match = "radius.noc.gulas.ch";
        ca-cert = "${builtins.fetchurl {
            url = "https://letsencrypt.org/certs/isrgrootx1.pem";
            sha256 = "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
            }}";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        addr-gen-mode = "stable-privacy";
        method = "auto";
      };
    };
  };
}
