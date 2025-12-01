{ pkgs, osConfig, ... }:

{
  services.flameshot = {
    enable = true;
    settings.General = with osConfig.grauly; {
      savePath = "/home/grauly/Pictures";
      uiColor = "${colors.gradient-from}";
      contrastUiColor = "${colors.mix}";
      showHelp = false;
      disabledTrayIcon = true;
    };
  };
}
