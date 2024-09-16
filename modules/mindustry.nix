{
  #for mutliplayer, yay
  services.tailscale.enable = true;
  networking.firewall = {
    allowedTCPPorts = [ 6567 ];
    allowedUDPPorts = [ 6567 ];
  };
}
