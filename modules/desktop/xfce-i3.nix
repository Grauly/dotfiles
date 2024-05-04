{
  imports = [
    ./xserver.nix
  ];
  services.xserver = {
    desktopManager.xfce = {
      enable = true;
      noDesktop = true;
    };
    windowManager.i3.enable = true;
  };
}
