{ home-manager, pkgs, pkgs-unstable, ... }:

{
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" "lp" ];
  };

  # stuff that needs to be enabled on system level for some reason or another
}
