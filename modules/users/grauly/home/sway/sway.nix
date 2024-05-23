{ pkgs, pkgs-unstable, config, lib, osConfig, ... }:

{
  imports = [
    ./waybar.nix
    ./mako.nix
    ./sway_styling.nix
    ./swaylock.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.sway =
    let
      swaycfg = config.wayland.windowManager.sway.config;
      resize-mode = "resize";
      shutdown-mode = "(l) lock (o) logout (s) shutdown (r) reboot (k) sleep";
    in
    {
      enable = true;
      package = pkgs.swayfx;
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
          "type:touchpad" = {
            natural_scroll = "enabled";
          };
        };
        keybindings = (import ./keybindings.nix { inherit pkgs swaycfg resize-mode shutdown-mode; });
        modes = (import ./sway_modes.nix { inherit pkgs swaycfg resize-mode shutdown-mode; });
        defaultWorkspace = "workspace number 1";
      };
      extraConfig = ''
        for_window [title="floating_shell"] floating enable, border pixel ${toString osConfig.grauly.style.border-width}, sticky enable
        for_window [title="Picture-in-Picture"] floating enable, border pixel ${toString osConfig.grauly.style.border-width}, sticky enable
      '';
    };
}
