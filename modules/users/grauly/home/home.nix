{
  imports = [
    ../packages/grauly_home_packages.nix
    ./sway/sway.nix
    ./shell_aliases.nix
    ./programs/programs.nix
    ./cursor.nix
  ];
  home.stateVersion = "23.11";
  home.username = "grauly";
  home.homeDirectory = "/home/grauly";

  programs.home-manager.enable = true;
}
