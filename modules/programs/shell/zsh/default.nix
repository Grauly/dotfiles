{ home-manager, pkgs, config, ... }:

{
  users.users.grauly = {
    shell = pkgs.zsh;
  };
  
  grauly.shell.launch-program = "${config.grauly.shell.standalone} -c";

  programs.zsh.enable = true;

  home-manager.users.grauly = {
    imports = [
      ./zsh_home.nix
    ];
  };
}
