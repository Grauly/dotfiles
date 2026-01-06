{ pkgs, ... }:

{
  environment.systemPackages = [
    (import ./multibg.nix { fetchFromGitHub = pkgs.fetchFromGitHub; rustPlatform = pkgs.rustPlatform; })
  ];
}