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
}
