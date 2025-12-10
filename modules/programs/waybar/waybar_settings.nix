{ pkgs, ... }:

let
  terminal = "${pkgs.kitty}/bin/kitty";
  shell = "${pkgs.zsh}/bin/zsh";
  nmtui = "${pkgs.networkmanager}/bin/nmtui";
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  floating_shell = "exec ${terminal} --detach -T floating_shell ${shell} -c";
  conn_stats_script = "${pkgs.unixtools.ping}/bin/ping 8.8.8.8 -i 1 -c 5 -q | ${pkgs.gnused}/bin/sed -rn 's#([0-9]+) packets transmitted, ([0-9]+) received, ([0-9]+)% packet loss, time [0-9]+ms#{\"text\":\"\\2/\\1 Packets received, \\3% Packet loss\", \"alt\":\"\\2/\\1@\\3%\", \"tooltip\":\"\\2/\\1@\\3% packet loss\", \"class\":\"noclass\",\"percentage\":\\3}#p'";
  cores = {core}: if core == 0 then "{icon${toString core}}" else "${cores {core = (core - 1);}}{icon${toString core}}";
  bar-height = 40;
in
{
  layer = "top";
  position = "top";
  modules-left = [ "niri/workspaces" ];
  modules-center = [ "clock#minimal" "sway/mode" ];
  modules-right = [
    "image#seperator_left"
    "group/cpu_container"
    "image#seperator_right"
    "memory"
    "custom/connectivity"
    "network"
    "pulseaudio"
    "backlight"
    "battery"
    "clock"
    ];

  "image#seperator_left" = {
    path = "${./assets/seperator-left.svg}";
    size = bar-height;
  };

  "image#seperator_right" = {
    path = "${./assets/seperator-right.svg}";
    size = bar-height;
  };

  "image#cpu" = {
    path = "${./assets/cpu.svg}";
    size = bar-height - 5;
  };

  cpu = {
    interval = 1;
    format = "${(cores {core = 19; })}";
    format-icons = [" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
  };
  
  "group/cpu_container" = {
    orientation = "inherit";
    modules = [
      "image#cpu"
      "cpu"
    ];
  };

  battery = {
    interval = 5;
    states = {
      caution = 30;
      warning = 20;
      critical = 10;
      redalert = 5;
    };
    format = "{capacity}%";
    format-caution = "/!\\ {capacity}%";
    format-warning = "/!\\ {capacity}% /!\\";
    format-critical = "/!!!\\ [{capacity}%] /!!!\\";
    format-redalert = "RED ALERT: {capacity}%";
    tooltip = true;
    tooltip-format = "Battery at {capacity}%\nDrawing {power}W\n{timeTo}";
  };

  clock = {
    interval = 1;
    format = "{:%H:%M}";
    format-alt = "{:%H:%M:%S\n%d.%m.%y}";
    tooltip-format = "<tt><small>{calendar}</small></tt>";
    calendar = {
      mode = "month";
      week-pos = "right";
    };
  };

  "clock#minimal" = {
    format = "{:%H:%M}";
  };

  "custom/connectivity" = {
    exec = "${conn_stats_script}";
    interval = 10;
    return-type = "json";
    format = "{icon}";
    format-icons = [
      "" #globe - connected
      "󰨹" #question mark cloud - connection shaky
      "󱘖" #connection lost
    ];
  };

  "custom/arrow_right" = {
    format = "";
    tooltip = false;
  };

  "custom/arrow_left" = {
    format = "";
    tooltip = false;
  };

  "custom/inv_arrow_left" = {
    format = "";
    tooltip = false;
  };

  "custom/inv_arrow_right" = {
    format = "";
    tooltip = false;
  };

  network = {
    interval = 10;
    format = ""; #X symbol
    format-ethernet = "󰈁"; #ethernet symbol bm44     4
    tooltip-format-ethernet = "{ipaddr}@{ifname} via {gwaddr}";
    format-wifi = ""; #wifi symbol
    tooltip-format-wifi = "{ipaddr}@{essid} ({signalStrength}%)";
    format-linked = "LINK LOST";
    format-disconnect = "NETWORK DISCONNECTED";
    on-click = "${floating_shell} ${nmtui}";
  };


  memory = {
    format = "RAM: {used}/{total}GB: {percentage}%";
    tooltip-format = "Swap: {swapUsed}/{swapTotal}: {swapPercentage}%";
    states = {
      ok = 50;
      in-use = 70;
      warning = 90;
      critical = 100;
    };
  };

  pulseaudio = {
    format = "Volume:\n{volume}%";
    format-muted = "MUTED";
    on-click = "${floating_shell} ${pulsemixer}";
  };

  backlight = {
    format = "Brightness:\n{percent}%";
  };
}
