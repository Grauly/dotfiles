{ config, ... }:

{
  wayland.windowManager.sway = {
    config = {
      fonts.names = [
        "JetBrainsMono Nerd Font"
        "Sans Serif"
      ];
      gaps = {
        inner = config.grauly.style.window-spacing;
        smartBorders = "off";
        smartGaps = true;
      };
      window = {
        border = config.grauly.style.border-width;
      };
      floating = {
        border = config.grauly.style.border-width;
      };
      colors = with config.grauly.colors; {
        background = error;
        focused = {
          background = mix;
          border = gradient-from;
          childBorder = gradient-from;
          indicator = highlight;
          text = text.color;
        };
        focusedInactive = {
          background = background;
          border = gradient-to;
          childBorder = gradient-to;
          indicator = gradient-to;
          text = text.color;
        };
        placeholder = {
          background = background;
          border = background;
          childBorder = background;
          indicator = background;
          text = text.color;
        };
        unfocused = {
          background = background;
          border = background-border;
          childBorder = background-border;
          indicator = background-border;
          text = text.lowlight;
        };
        urgent = {
          background = background;
          border = highlight;
          childBorder = highlight;
          indicator = highlight;
          text = text.highlight;
        };
      };
    };
    extraConfig = ''
      blur enable
      corner_radius ${toString config.grauly.style.border-radius}
    '';
  };
}
