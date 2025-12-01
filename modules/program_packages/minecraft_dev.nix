{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/intellij
    ../programs/gimp.nix
    ../programs/prismlauncher.nix
  ];

  environment.systemPackages = with pkgs; [
    blockbench
    bitwarden-desktop
  ] ++ (with pkgs-unstable; [
  ]);
}
