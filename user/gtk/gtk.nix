{ pkgs, config, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.mint-themes;
      name = "Mint-Y-Dark-Purple";
    };

    iconTheme = {
      package = pkgs.mint-y-icons;
      name = "Mint-Y-Dark-Purple";
    };

    gtk4.theme = config.gtk.theme;
    
    colorScheme = "dark";
  };
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
}
