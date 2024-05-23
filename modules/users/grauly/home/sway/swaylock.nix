{ pkgs, osConfig, ... }:

let
  clear = "#00000000";
in 
{
  programs.swaylock = with osConfig.grauly; {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      image = "${./lockscreen.png}";
      indicator-radius = 220;
      indicator-thickness = 20;
      inside-color = clear;
      inside-clear-color = clear;
      inside-caps-lock-color = clear;
      inside-ver-color = clear;
      inside-wrong-color = clear;
      key-hl-color = colors.gradient-from;
      layout-text-color = colors.text.color;
      line-color = clear;
      line-clear-color = clear;
      line-caps-lock-color = clear;
      line-ver-color = clear;
      line-wrong-color = clear;
      ring-color = clear;
      ring-clear-color = clear;
      ring-caps-lock-color = clear;
      ring-ver-color = clear;
      ring-wrong-color = clear;
      separator-color = clear;
      text-color = colors.text.color;
      text-clear-color = colors.text.color;
      text-caps-lock-color = colors.text.color;
      text-ver-color = colors.text.color;
      text-wrong-color = colors.text.color;
      clock = true;
      effect-blur = "3x1";
      grace = 2;
      text-clear = "Access Granted";
      text-caps-lock = "CAPS LOCK";
      text-ver = "Verifying access code";
      text-wrong = "Access Denied";
    };
  };
}
