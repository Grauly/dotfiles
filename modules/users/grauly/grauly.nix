{ home-manager, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./packages/grauly_user_packages.nix
    ./modules/modules.nix
  ];
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" "lp"];
    shell = pkgs.zsh;
  };
  #do it here, so it actually gets recognized
  home-manager.users.grauly = import ./home/home.nix;
}
