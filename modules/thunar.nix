{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
    ];
  };
  programs.xfconf.enable = true;
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
