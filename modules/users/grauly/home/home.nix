{
  imports = [
    ../packages/grauly_home_packages.nix
    ./git.nix
    ./default_programs.nix
    ./sway.nix
    ./shell_aliases.nix
    ./zsh.nix
  ];
  home.stateVersion = "23.11";
  home.username = "grauly";
  home.homeDirectory = "/home/grauly";

  programs.home-manager.enable = true;
}
