{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };
}
