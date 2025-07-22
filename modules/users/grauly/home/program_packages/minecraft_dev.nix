{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/intellij
    ./core_utils.nix
    ../programs/gimp.nix
    ../programs/prismlauncher.nix
  ];

  home.packages = with pkgs; [
    blockbench
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
