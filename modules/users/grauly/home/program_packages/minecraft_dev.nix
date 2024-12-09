{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/intellij.nix
    ./core_utils.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    blockbench
    gimp
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
