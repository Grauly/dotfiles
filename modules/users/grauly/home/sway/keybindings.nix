{ pkgs, swaycfg, ... }:

{
  # Reimplement Sway hotkeys, because this overrides them
  # Basics
  "${swaycfg.modifier}+Return" = "exec ${swaycfg.terminal}";
  "${swaycfg.modifier}+q" = "kill";
  "${swaycfg.modifier}+Control+r" = "reload";

  # Moving
  "${swaycfg.modifier}+Shift+${swaycfg.right}" = "move container to workspace next, workspace next";
  "${swaycfg.modifier}+Shift+${swaycfg.left}" = "move container to workspace prev, workspace prev";
  "${swaycfg.modifier}+${swaycfg.left}" = "workspace prev";
  "${swaycfg.modifier}+${swaycfg.right}" = "workspace next";

  # Workspaces
  "${swaycfg.modifier}+1" = "workspace number 1";
  "${swaycfg.modifier}+2" = "workspace number 2";
  "${swaycfg.modifier}+3" = "workspace number 3";
  "${swaycfg.modifier}+4" = "workspace number 4";
  "${swaycfg.modifier}+5" = "workspace number 5";
  "${swaycfg.modifier}+6" = "workspace number 6";
  "${swaycfg.modifier}+7" = "workspace number 7";
  "${swaycfg.modifier}+8" = "workspace number 8";
  "${swaycfg.modifier}+9" = "workspace number 9";
  "${swaycfg.modifier}+0" = "workspace number 10";
  # Workspaces
  "${swaycfg.modifier}+Shift+1" = "move container to workspace number 1";
  "${swaycfg.modifier}+Shift+2" = "move container to workspace number 2";
  "${swaycfg.modifier}+Shift+3" = "move container to workspace number 3";
  "${swaycfg.modifier}+Shift+4" = "move container to workspace number 4";
  "${swaycfg.modifier}+Shift+5" = "move container to workspace number 5";
  "${swaycfg.modifier}+Shift+6" = "move container to workspace number 6";
  "${swaycfg.modifier}+Shift+7" = "move container to workspace number 7";
  "${swaycfg.modifier}+Shift+8" = "move container to workspace number 8";
  "${swaycfg.modifier}+Shift+9" = "move container to workspace number 9";
  "${swaycfg.modifier}+Shift+0" = "move container to workspace number 10";
  "${swaycfg.modifier}+tab" = "workspace back_and_forth";

  # Define own hotkeys
  # Define FN key behavior
  "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
  "--locked XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
  "--locked XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +5%";
  "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
  "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";

  # Define logout command

  # Define wofi launcher
  "${swaycfg.modifier}+d" = "exec ${swaycfg.menu}";
  "${swaycfg.modifier}+space" = "exec ${swaycfg.menu}";

  "${swaycfg.modifier}+KP_Enter" = "exec rofi -show calc";

  "${swaycfg.modifier}+e" = "exec thunar";
  "Alt+Return" = "exec ${swaycfg.terminal}";
}
