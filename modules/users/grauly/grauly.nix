{ home-manager, pkgs, pkgs-unstable, ... }:

{
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" "lp" ];
    shell = pkgs.zsh;
  };

  # stuff that needs to be enabled on system level for some reason or another
  programs.zsh.enable = true;
  programs.steam.enable = true;

  
  #do it here, so it actually gets recognized
  home-manager.users.grauly = import ./home;
  grauly = {
    colors = {
      gradient-from = "#8c27e9a0";
      gradient-to = "#2c01baa0";
      mix = "#5e15d2";
      background = "#110021a0";
      background-3 = "#110021";
      background-border = "#302635a0";
      background-border-3 = "#302635";
      highlight = "#c6073a";
      error = "#6ff904";
      text = {
        color = "#f2f2f2";
        highlight = "#c65001";
        lowlight = "#8845b7";
      };
    };
    style = {
      border-radius = 7;
      border-width = 1;
      window-spacing = 4;
      opacity = 0.612;
      blur = 8;
    };
  };
}
