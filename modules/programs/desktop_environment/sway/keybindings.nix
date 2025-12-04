{ pkgs, pkgs-unstable, swaycfg, shutdown-mode, ... }:

{
  # Define own hotkeys
  # Define FN key behavior
  "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
  "--locked XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
  "--locked XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
  "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
  "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";

  # Define logout command
  "${swaycfg.modifier}+Shift+e" = "mode \"${shutdown-mode}\"";

  # Define wofi launcher
  "${swaycfg.modifier}+d" = "exec ${swaycfg.menu}";

  "${swaycfg.modifier}+KP_Enter" = "exec rofi -show calc";

  "${swaycfg.modifier}+e" = "exec ${swaycfg.terminal} --detach ${pkgs.zsh}/bin/zsh -c ${pkgs-unstable.yazi}/bin/yazi";

  # Screenshots
  "Pause" = "exec ${pkgs.flameshot}/bin/flameshot gui -r | ${pkgs.wl-clipboard}/bin/wl-copy";

  # Extra Terminal
  "Ctrl+${swaycfg.modifier}+t" = "exec ${swaycfg.terminal} --detach -T floating_shell";
  
  # Close Windows
  "${swaycfg.modifier}+q" = "kill";
}
