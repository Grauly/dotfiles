{ home-manager, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.grauly.programs.git.settings = {
    enable = true;
    user = {
      email = "nils.dellemann@web.de";
      name = "Grauly";
    };
    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
