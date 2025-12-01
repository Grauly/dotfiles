{ home-manager, ... }:

{
  home-manager.user.grauly = import ./sway_home.nix;
}