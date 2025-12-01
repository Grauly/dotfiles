{ home-manager, pkgs, ... }:

{
  users.users.grauly = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.grauly.home = import ./zsh_home.nix;
}
