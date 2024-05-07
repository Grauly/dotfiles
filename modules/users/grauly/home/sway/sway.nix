{ pkgs, config, lib, ... }:

{
  imports = [
    ./swaybar.nix
  ];

  wayland.windowManager.sway =
    let
      swaycfg = config.wayland.windowManager.sway.config;
    in
    {
      enable = true;
      config = {
        #todo: assign left and right, throws "already defined"
        menu = "${pkgs.wofi}/bin/wofi --show=drun";
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
