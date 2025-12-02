{ config, ... }:

{
  window = {
    opacity = config.grauly.style.opacity;
    blur = config.grauly.style.blur != 0;
  };
  colors = {
    primary = {
      foreground = config.grauly.colors.text.color;
      background = config.grauly.colors.background-3;
    };
  };
  font = {
    normal.family = "JetBrainsMono Nerd Font";
  };
}
