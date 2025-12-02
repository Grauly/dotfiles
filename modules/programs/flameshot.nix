{ home-manager, pkgs, config, ... }:

{
  home-manager.users.grauly.services.flameshot = {
    enable = true;
    settings.General = with config.grauly; {
      savePath = "/home/grauly/Pictures";
      uiColor = "${colors.gradient-from}";
      contrastUiColor = "${colors.mix}";
      showHelp = false;
      disabledTrayIcon = true;
    };
  };
}
