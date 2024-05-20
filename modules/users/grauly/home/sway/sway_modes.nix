{ pkgs, swaycfg, resize-mode, shutdown-mode }:

let
  def-mode-cmd = "${pkgs.sway}/bin/swaymsg ${def-mode}";
  def-mode = "mode default";
  notify = "${pkgs.libnotify}/bin/notify-send";
  action-delay = "sleep 3";
  escapes = {
    Escape = def-mode;
    Return = def-mode;
  };
  countdown-delay = 1;
  countdown =  title: text: count: (builtins.concatStringsSep " && " (builtins.genList (i: ("${notify} '${title}' '${text} ${(builtins.toString (count - i))}' -t ${(builtins.toString (countdown-delay * 1000))} && sleep ${(builtins.toString countdown-delay)}")) count));
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
  } // escapes;
  "${shutdown-mode}" = {
    "l" = "exec ${def-mode-cmd} && ${(countdown "Engaging system lock" "Lockdown in:" 3)} && ${pkgs.swaylock}/bin/swaylock && ${notify} 'Welcome back!'";
    "o" = "exec ${def-mode-cmd} && ${(countdown "Logging out" "Lockout in:" 3)} && ${pkgs.systemd}/bin/loginctl terminate-user $USER"; 
    "s" = "exec ${def-mode-cmd} && ${(countdown "Shutting down" "Lights out in:" 3)} && ${pkgs.systemd}/bin/systemctl poweroff";
    "r" = "exec ${def-mode-cmd} && ${(countdown "Rebooting..." "Reboot in:" 3)} && ${pkgs.systemd}/bin/systemctl reboot"; 
    "k" = "exec ${def-mode-cmd} && ${(countdown "Going to sleep" "Falling asleep:" 3)} && ${pkgs.systemd}/bin/systemctl suspend";
  } // escapes;
}
