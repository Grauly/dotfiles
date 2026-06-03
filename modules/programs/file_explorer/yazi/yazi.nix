{ pkgs-unstable, ... }:

{
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = (import ./yazi-config.nix);
    keymap = (import ./yazi-keymap.nix);
  };
}
