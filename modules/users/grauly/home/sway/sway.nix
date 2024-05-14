{ pkgs, pkgs-unstable, config, lib, ... }:

{
  imports = [
    ./waybar.nix
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
        modifier = "Mod4";
        #todo: assign left and right, throws "already defined"
        menu = "rofi -show combi -modes combi -combi-modes \"drun,run,emoji\"";
        bars = [ ];
        terminal = "kitty";
        input = {
          "type:keyboard" = {
            xkb_layout = "de";
          };
        };
        fonts.names = [
          "JetBrainsMono Nerd Font"
          "Sans Serif"
        ];
        keybindings = (import ./keybindings.nix { inherit pkgs swaycfg; });
      };
      extraConfig = ''
        for_window [title="floating_shell"] floating enable, border pixel 1, sticky enable
      '';
    };
}
