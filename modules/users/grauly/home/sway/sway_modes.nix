{ pkgs, swaycfg, resize-mode, shutdown-mode }:

let
  def-mode-cmd = "${pkgs.sway}/bin/swaymsg ${def-mode}";
  def-mode = "mode default";
  escapes = {
    Escape = def-mode;
    Return = def-mode;
  };
in
{
  "${resize-mode}" = {
    "${swaycfg.modifier}+${swaycfg.left}" = "resize grow width 10px";
    "${swaycfg.modifier}+${swaycfg.down}" = "resize shrink height 10px";
    "${swaycfg.modifier}+${swaycfg.up}" = "resize grow height 10px";
    "${swaycfg.modifier}+${swaycfg.right}" = "resize shrink width 10px";

    "${swaycfg.modifier}+Left" = "resize grow width 10px";
    "${swaycfg.modifier}+Down" = "resize shrink height 10px";
    "${swaycfg.modifier}+Up" = "resize grow height 10px";
    "${swaycfg.modifier}+Right" = "resize shrink width 10px";

    "${swaycfg.modifier}+Shift+${swaycfg.left}" = "resize grow width 50px";
    "${swaycfg.modifier}+Shift+${swaycfg.down}" = "resize shrink height 50px";
    "${swaycfg.modifier}+Shift+${swaycfg.up}" = "resize grow height 50px";
    "${swaycfg.modifier}+Shift+${swaycfg.right}" = "resize shrink width 50px";

    "${swaycfg.modifier}+Shift+Left" = "resize grow width 50px";
    "${swaycfg.modifier}+Shift+Down" = "resize shrink height 50px";
    "${swaycfg.modifier}+Shift+Up" = "resize grow height 50px";
    "${swaycfg.modifier}+Shift+Right" = "resize shrink width 50px";

    "${swaycfg.modifier}+minus" = "gaps inner current minus 5px";
    "${swaycfg.modifier}+plus" = "gaps inner current plus 5px";
  }//escapes;
  "${shutdown-mode}" = {
    "l" = "exec ${pkgs.swaylock}/bin/swaylock && ${def-mode-cmd}";
    "o" = "exec ${pkgs.systemd}/bin/loginctl terminate-user $USER && ${def-mode-cmd}";
    "s" = "exec ${pkgs.systemd}/bin/systemctl poweroff && ${def-mode-cmd}";
    "r" = "exec ${pkgs.systemd}/bin/systemctl reboot && ${def-mode-cmd}";
    "k" = "exec ${pkgs.systemd}/bin/systemctl suspend && ${def-mode-cmd}";
  }//escapes;
}
