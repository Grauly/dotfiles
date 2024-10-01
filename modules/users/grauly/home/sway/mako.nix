{ osConfig, ... }:

{
  services.mako = with osConfig.grauly; {
    enable = true;
    defaultTimeout = 10 * 1000;
    anchor = "bottom-right";
    backgroundColor = colors.background;
    borderColor = colors.mix;
    borderRadius = style.border-radius;
    borderSize = style.border-width;
    progressColor = "over ${colors.highlight}";
    textColor = colors.text.color;
    extraConfig = ''
      [urgency=critical]
      border-color=${colors.highlight}
    '';
  };
}
