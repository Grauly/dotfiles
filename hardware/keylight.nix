{ pkgs, pkgs-unstable, ... }:

{
  #note: user that wants to edit keyboard lights needs to be in this group
  users.groups.tux_leds = {};
  services.udev.extraRules = ''
    SUBSYSTEM=="leds", ACTION=="add", KERNEL=="rgb:*", RUN+="${pkgs.coreutils}/bin/chgrp tux_leds /sys/class/leds/%k/multi_intensity", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/multi_intensity"
    SUBSYSTEM=="leds", ACTION=="add", KERNEL=="rgb:*", RUN+="${pkgs.coreutils}/bin/chgrp tux_leds /sys/class/leds/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/leds/%k/brightness"
  '';
}