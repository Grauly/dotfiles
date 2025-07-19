{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/intellij
    ./core_utils.nix
    ../programs/gimp.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    blockbench
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
