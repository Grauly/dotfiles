{ osConfig, ... }:

{
  window = {
    opacity = osConfig.grauly.style.opacity;
    blur = osConfig.grauly.style.blur != 0;
  };
  colors = {
    primary = {
      foreground = osConfig.grauly.colors.text.color;
      background = osConfig.grauly.colors.background-3;
    };
  };
  font = {
    normal.family = "JetBrainsMono Nerd Font";
  };
}
