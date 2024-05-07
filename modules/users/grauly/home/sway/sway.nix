{pkgs, config, ... }:

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
        bars = [ ];
        terminal = "kitty";
        input = {
          "type:keyboard" = {
            xkb_layout = "de";
          };
        };
        keybindings = (import ./keybindings.nix {inherit pkgs swaycfg;});
      };
    };
}
