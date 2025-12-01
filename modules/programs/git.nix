{ home-manager, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.grauly.programs.git = {
    enable = true;
    userEmail = "nils.dellemann@web.de";
    userName = "Grauly";
    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
