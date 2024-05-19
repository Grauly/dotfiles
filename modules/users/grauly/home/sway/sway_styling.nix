{ osConfig, ... }:

{
  fonts.names = [
    "JetBrainsMono Nerd Font"
    "Sans Serif"
  ];
  gaps = {
    inner = osConfig.grauly.style.border-radius;
    smartBorders = "off";
    smartGaps = true;
  };
  window = {
    border = 3;
  };
  floating = {
    border = 5;
  };
  colors = with osConfig.grauly.colors; {
    background = error;
    focused = {
      background = mix;
      border = gradient-from;
      childBorder = gradient-from;
      indicator = gradient-from;
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
}
