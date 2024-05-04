{ home-manager, ... }:

{
  imports = [
    ./packages/grauly_user_packages.nix
  ];
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.grauly = import ./home/home.nix;
}
