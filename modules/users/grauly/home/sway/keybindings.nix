{ pkgs, swaycfg, resize-mode, shutdown-mode, ... }:

{
  # Reimplement Sway hotkeys, because this overrides them
  # Basics
  "${swaycfg.modifier}+Return" = "exec ${swaycfg.terminal}";
  "${swaycfg.modifier}+q" = "kill";
  "${swaycfg.modifier}+Control+r" = "reload";

  # Focus
  "${swaycfg.modifier}+${swaycfg.left}" = "focus left";
  "${swaycfg.modifier}+${swaycfg.down}" = "focus down";
  "${swaycfg.modifier}+${swaycfg.up}" = "focus up";
  "${swaycfg.modifier}+${swaycfg.right}" = "focus right";

  "${swaycfg.modifier}+Left" = "focus left";
  "${swaycfg.modifier}+Down" = "focus down";
  "${swaycfg.modifier}+Up" = "focus up";
  "${swaycfg.modifier}+Right" = "focus right";

  # Moving
  "${swaycfg.modifier}+Shift+${swaycfg.left}" = "move left";
  "${swaycfg.modifier}+Shift+${swaycfg.down}" = "move down";
  "${swaycfg.modifier}+Shift+${swaycfg.up}" = "move up";
  "${swaycfg.modifier}+Shift+${swaycfg.right}" = "move right";

  "${swaycfg.modifier}+Shift+Left" = "move left";
  "${swaycfg.modifier}+Shift+Down" = "move down";
  "${swaycfg.modifier}+Shift+Up" = "move up";
  "${swaycfg.modifier}+Shift+Right" = "move right";

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

  # Moving workspaces between outputs
  "${swaycfg.modifier}+Control+${swaycfg.left}" = "move workspace to output left";
  "${swaycfg.modifier}+Control+${swaycfg.down}" = "move workspace to output down";
  "${swaycfg.modifier}+Control+${swaycfg.up}" = "move workspace to output up";
  "${swaycfg.modifier}+Control+${swaycfg.right}" = "move workspace to output right";

  "${swaycfg.modifier}+Control+Left" = "move workspace to output left";
  "${swaycfg.modifier}+Control+Down" = "move workspace to output down";
  "${swaycfg.modifier}+Control+Up" = "move workspace to output up";
  "${swaycfg.modifier}+Control+Right" = "move workspace to output right";

  # Splits
  "${swaycfg.modifier}+b" = "splith";
  "${swaycfg.modifier}+v" = "splitv";

  # Layout
  "${swaycfg.modifier}+s" = "layout stacking";
  "${swaycfg.modifier}+w" = "layout tabbed";
  "${swaycfg.modifier}+t" = "layout toggle split";
  "${swaycfg.modifier}+f" = "fullscreen toggle";

  "${swaycfg.modifier}+a" = "focus parent";

  "${swaycfg.modifier}+Control+space" = "floating toggle";

  # Resize mode
  "${swaycfg.modifier}+r" = "mode \"${resize-mode}";

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
  "${swaycfg.modifier}+space" = "exec ${swaycfg.menu}";

  "${swaycfg.modifier}+KP_Enter" = "exec rofi -show calc";

  "${swaycfg.modifier}+e" = "exec ${pkgs.xfce.thunar}/bin/thunar";
  "Alt+Return" = "exec ${swaycfg.terminal}";
}
