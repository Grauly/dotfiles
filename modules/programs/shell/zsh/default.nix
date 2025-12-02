{ home-manager, pkgs, config, ... }:

{
  users.users.grauly = {
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager.users.grauly = (import ./zsh_home.nix { inherit pkgs config; });
}
