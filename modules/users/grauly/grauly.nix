{ home-manager, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./options.nix
    ./packages/grauly_user_packages.nix
    ./modules/modules.nix
  ];
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" "lp" ];
    shell = pkgs.zsh;
  };
  #do it here, so it actually gets recognized
  home-manager.users.grauly = import ./home/home.nix;
  grauly = {
    colors = {
      gradient-from = "#8c27e9a0";
      gradient-to = "#2c01baa0";
      mix = "#5e15d2";
      background = "#110021a0";
      text = {
        color = "#f2f2f2";
        highlight = "#c65001";
      };
    };
    style = {
      border-radius = 7;
    };
  };
}
