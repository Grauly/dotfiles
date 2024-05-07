{
  imports = [
    ./swaybar.nix
  ];
  
  wayland.windowManager.sway = {
    enable = true;
    config = {
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
        };
      };
    };
  };
}