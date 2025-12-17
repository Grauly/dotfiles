{ pkgs, pkgs-unstable, lib, config, osConfig, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.sway =
    let
      swaycfg = config.wayland.windowManager.sway.config;
      shutdown-mode = "(l) lock (o) logout (s) shutdown (r) reboot (k) sleep";
    in
    {
      enable = true;
      package = pkgs.swayfx;
      # disable config checking to get swayfx to run: https://github.com/nix-community/home-manager/issues/5379
      checkConfig = false;
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
            tap = "enabled";
          };
        };
        keybindings = (lib.mkOptionDefault (import ./keybindings.nix { inherit pkgs pkgs-unstable swaycfg shutdown-mode; }));
        modes = (lib.mkOptionDefault (import ./sway_modes.nix { inherit pkgs swaycfg shutdown-mode; }));
        defaultWorkspace = "workspace number 1";
        output = {
          "*" = {
            bg = "${./background.png} fill";
          };
          "BOE 0x09C2 Unknown" = {
            mode = "2560x1440@165.003Hz";
          };
        };
        floating = {
          criteria = [
            {
              title = "floating_shell";
            }
            {
              title = "Picture-in-Picture";
            }
            {
              title = "Discord Popout";
            }
            {
              title = "Steam - Update News";
            }
            {
              title = "Welcome to IntelliJ IDEA";
            }
            {
              title = "Confirm Exit";
            }
          ];
          border = osConfig.grauly.style.border-width;
        };
      };
      extraOptions = [
        "--unsupported-gpu"
      ];
      extraConfig = ''
        for_window [title="floating_shell"] sticky enable
        for_window [title="Picture-in-Picture"] sticky enable
        for_window [title="Discord Popout"] sticky enable
      '';
      # output eDP-1 color_profile icc ${./Monitor_1_1_2025-05-06_22-28_2.2_F-S_XYZLUT+MTX.icc}
      # https://github.com/WillPower3309/swayfx/issues/348
    };
}
