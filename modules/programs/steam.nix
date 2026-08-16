{
  programs = {
    gamescope = {
      enable = true;
      #capSysNice = true; https://github.com/NixOS/nixpkgs/issues/523200
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}
