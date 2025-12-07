{ home-manager, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.grauly.programs.git = {
    enable = true;
    settings = {
      user = {
        email = "nils.dellemann@web.de";
        name = "Grauly";
      };
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
