{ home-manager, ... }:

{
  programs.kdeconnect.enable = true;

  home-manager.users.grauly.services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
