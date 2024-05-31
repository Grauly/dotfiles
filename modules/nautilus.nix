{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services = {
    gnome.sushi.enable = true;
    gvfs.enable = true;
  };
}
