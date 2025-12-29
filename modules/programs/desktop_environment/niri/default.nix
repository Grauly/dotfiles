{ niri, ... }:

{
  imports = [
    ./autostart.nix
  ];
  
  home-manager.users.grauly = {
    imports = [
      ./config
      niri.homeModules.niri
    ];
  };
}