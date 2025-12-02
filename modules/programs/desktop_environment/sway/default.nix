{ home-manager, ... }:

{
  home-manager.users.grauly = (import ./sway_home.nix);
}