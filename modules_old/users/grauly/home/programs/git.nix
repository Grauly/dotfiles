{
  programs.git = {
    enable = true;
    userEmail = "nils.dellemann@web.de";
    userName = "Grauly";
    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
