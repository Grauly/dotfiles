{ home-manager, pkgs, ... }:

{
  imports = [
    ./packages/grauly_user_packages.nix
  ];
  users.users.grauly = {
    isNormalUser = true;
    description = "Grauly";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  #do it here, so it actually gets recognized
  programs.zsh.enable = true;
  home-manager.users.grauly = import ./home/home.nix;
}
