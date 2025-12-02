{ home-manager, pkgs, pkgs-unstable, config, ... }:

{
  home-manager.users.grauly = (import ./rofi.nix { inherit pkgs pkgs-unstable config; });
}
