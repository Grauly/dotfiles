{ home-manager, pkgs, config, ... }:

{
  users.users.grauly = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.grauly = {
    imports = [
      ./zsh_home.nix
    ];
  };
}
