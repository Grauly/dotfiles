{ pkgs, pkgs-unstable, config, lib, ... }:

{
  imports = [
    ./swaybar.nix
    ./mako.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.sway =
    let
      swaycfg = config.wayland.windowManager.sway.config;
    in
    {
      enable = true;
      config = {
        #todo: assign left and right, throws "already defined"
        menu = "${pkgs.rofi}/bin/rofi -show combi -modes combi -combi-modes \"drun,run,calc\"";
        bars = [ ];
        terminal = "kitty";
        input = {
          "type:keyboard" = {
            xkb_layout = "de";
          };
        };
        keybindings = (import ./keybindings.nix { inherit pkgs swaycfg; });
      };
    };
}
