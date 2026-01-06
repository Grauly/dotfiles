{ pkgs, config, osConfig, ... }:

with config.lib.niri.actions; {
  # Dedicated Hotkeys
  "Mod+Return".action.spawn = osConfig.grauly.terminal.standalone;
  "Mod+Shift+Return".action.spawn = "kitty"; # fallback
  "Mod+D".action.spawn = ["rofi" "-show" "combi" "-modes" "combi" "-combi-modes" "drun,run,emoji"];
  "Mod+KP_Enter".action.spawn = ["rofi" "-show" "calc"];
  "Mod+E".action.spawn = osConfig.grauly.terminal.detach ++ osConfig.grauly.shell.launch-program ++ [ "yazi" ];
  "Mod+Alt+L".action.spawn = "swaylock";
  "Mod+O".action = toggle-overview;
  "Mod+Q".action = close-window;
  
  # Loudness / Brightness
  "XF86AudioRaiseVolume" = {
    allow-when-locked = true;
    action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
  };
  "XF86AudioLowerVolume" = {
    allow-when-locked = true;
    action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";     
  };
  "XF86AudioMute" = {
    allow-when-locked = true;
    action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";     
  };
  "XF86AudioMicMute" = {
    allow-when-locked = true;
    action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";     
  };

  "XF86MonBrightnessUp" = {
    allow-when-locked = true;
    action.spawn = ["brightnessctl" "--class=backlight" "set" "+5%"];
  };
  "XF86MonBrightnessDown" = {
    allow-when-locked = true;
    action.spawn = ["brightnessctl" "--class=backlight" "set" "+5%"];
  };

  # Navigate around
  "Mod+Left".action = focus-column-left;
  "Mod+Right".action = focus-column-right;
  "Mod+Up".action = focus-workspace-up;
  "Mod+Down".action = focus-workspace-down;

  "Mod+H".action = focus-column-left;
  "Mod+L".action = focus-column-right;
  "Mod+K".action = focus-workspace-up;
  "Mod+J".action = focus-workspace-down;

  # Move windows around
  "Mod+Shift+Left".action = move-column-left;
  "Mod+Shift+Right".action = move-column-right;
  "Mod+Shift+Up".action = move-workspace-up;
  "Mod+Shift+Down".action = move-workspace-down;

  "Mod+Shift+H".action = move-column-left;
  "Mod+Shift+L".action = move-column-right;
  "Mod+Shift+K".action = move-workspace-up;
  "Mod+Shift+J".action = move-workspace-down;

  # Go to start/end of a column
  "Mod+Shift+I".action = focus-column-first;
  "Mod+Shift+A".action = focus-column-last;

  # Scrolling
  "Mod+WheelScrollDown" = {
    cooldown-ms = 150;
    action = focus-workspace-down;
  };
  "Mod+WheelScrollUp" = {
    cooldown-ms = 150;
    action = focus-workspace-up;
  };
  "Mod+Ctrl+WheelScrollDown" = {
    cooldown-ms = 150;
    action = move-column-to-workspace-down;
  };
  "Mod+Ctrl+WheelScrollUp" = {
    cooldown-ms = 150;
    action = move-column-to-workspace-up;
  };

  "Mod+WheelScrollRight".action = focus-column-right;
  "Mod+WheelScrollLeft".action = focus-column-left;
  "Mod+Ctrl+WheelScrollRight".action = move-column-right;
  "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

  "Mod+Shift+WheelScrollDown".action = focus-column-right;
  "Mod+Shift+WheelScrollUp".action = focus-column-left;

  # The numbers, what do they mean
  "Mod+1".action.focus-workspace = 1;
  "Mod+2".action.focus-workspace = 2;
  "Mod+3".action.focus-workspace = 3;
  "Mod+4".action.focus-workspace = 4;
  "Mod+5".action.focus-workspace = 5;
  "Mod+6".action.focus-workspace = 6;
  "Mod+7".action.focus-workspace = 7;
  "Mod+8".action.focus-workspace = 8;
  "Mod+9".action.focus-workspace = 9;

  "Mod+Shift+1".action.move-column-to-workspace = 1;
  "Mod+Shift+2".action.move-column-to-workspace = 2;
  "Mod+Shift+3".action.move-column-to-workspace = 3;
  "Mod+Shift+4".action.move-column-to-workspace = 4;
  "Mod+Shift+5".action.move-column-to-workspace = 5;
  "Mod+Shift+6".action.move-column-to-workspace = 6;
  "Mod+Shift+7".action.move-column-to-workspace = 7;
  "Mod+Shift+8".action.move-column-to-workspace = 8;
  "Mod+Shift+9".action.move-column-to-workspace = 9;

  # Consume / Expell ops - lets see how exactly this works
  "Mod+Ctrl+Shift+Left".action = consume-or-expel-window-left;
  "Mod+Ctrl+Shift+Right".action = consume-or-expel-window-right;

  "Mod+Comma".action = consume-window-into-column;
  "Mod+Period".action = expel-window-from-column;

  # Layout / sizing
  "Mod+R".action = switch-preset-column-width;
  "Mod+Shift+R".action = switch-preset-window-height;
  "Mod+Ctrl+R".action = reset-window-height;

  "Mod+F".action = maximize-column;
  "Mod+Shift+F".action = fullscreen-window;
  "Mod+Ctrl+F".action = expand-column-to-available-width;

  "Mod+C".action = center-column;
  "Mod+Ctrl+C".action = center-visible-columns;

  "Mod+Minus".action.set-column-width = "-10%";
  "Mod+Equal".action.set-column-width = "+10%";

  "Mod+Shift+Minus".action.set-window-height = "-10%";
  "Mod+Shift+Equal".action.set-window-height = "+10%";

  # Floating / tabs
  "Mod+Space".action = toggle-window-floating;
  "Mod+Shift+Space".action = switch-focus-between-floating-and-tiling;

  "Mod+W".action = toggle-column-tabbed-display;

  # Screenshots
  "Print".action.screenshot = {};
  "Ctrl+Print".action.screenshot-screen = {};
  "Alt+Print".action.screenshot-window = {};

  ### Inhibit / quit / power
  "Mod+Escape" = {
    allow-inhibiting = false;
    action = toggle-keyboard-shortcuts-inhibit;
  };

  "Mod+Shift+E".action = quit;
  "Ctrl+Alt+Delete".action = quit;

  "Mod+Shift+P".action = power-off-monitors;
}