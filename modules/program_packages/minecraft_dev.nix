{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/intellij
    ../programs/gimp.nix
    ../programs/prismlauncher.nix
  ];

  home.packages = with pkgs; [
    blockbench
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
