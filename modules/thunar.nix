{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
