{ osConfig, ... }:

{
  services.mako = with osConfig.grauly; {
    enable = true;
    settings = {
      default-timeout = 10 * 1000;
      anchor = "bottom-right";
      background-color = colors.background;
      border-color = colors.mix;
      border-radius = style.border-radius;
      border-size = style.border-width;
      progress-color = "over ${colors.highlight}";
      text-color = colors.text.color;
      "urgency=critical" = {
        border-color="${colors.highlight}";
      };
    };
  };
}
