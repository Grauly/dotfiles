{ pkgs, pkgs-unstable, ... }:
{
  home-manager.users.grauly = import ./intellij.nix;
  
  programs.direnv = {
    enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    #(import ./intellij_WL.nix { inherit pkgs pkgs-unstable; })
    jetbrains-toolbox
  ];
}
