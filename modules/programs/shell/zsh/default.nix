{ home-manager, pkgs, config, ... }:

{
  grauly.shell = {
    package = pkgs.zsh;
    launch-program = ["${config.grauly.shell.standalone}" "-c"];
  };

  programs.zsh.enable = true;

  home-manager.users.grauly = {
    imports = [
      ./zsh_home.nix
    ];
  };
}
