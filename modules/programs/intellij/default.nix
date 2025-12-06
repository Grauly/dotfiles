{
  home-manager.users.grauly = import ./intellij.nix;
  
  programs.direnv = {
    enable = true;
  };
}
