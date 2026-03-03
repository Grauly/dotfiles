{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    prismlauncher
  ];
}
