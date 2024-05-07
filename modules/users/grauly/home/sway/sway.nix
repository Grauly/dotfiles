{
  imports = [
    ./swaybar.nix
  ];
  
  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "kitty";
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
        };
      };
    };
  };
}