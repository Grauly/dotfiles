{ colors, ... }:

let
  clear = "#00000000";
in {
      image = "${./lockscreen1.png}";
      indicator-radius = 578;
      indicator-thickness = 30;
      indicator-x-position = 1897;
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
      text-color = colors.text.color_inverse;
      text-clear-color = colors.text.color_inverse;
      text-caps-lock-color = colors.text.color_inverse;
      text-ver-color = colors.text.color_inverse;
      text-wrong-color = colors.text.color_inverse;
      clock = true;
      text-clear = "Reset";
      text-caps-lock = "CAPS LOCK";
      text-ver = "Verifying";
      text-wrong = "Access Denied";
}