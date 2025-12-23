{ pkgs, osConfig, ... }:

let
  terminal = "${pkgs.kitty}/bin/kitty";
  shell = "${pkgs.zsh}/bin/zsh";
  nmtui = "${pkgs.networkmanager}/bin/nmtui";
  pulsemixer = "${pkgs.pulsemixer}/bin/pulsemixer";
  floating_shell = "exec ${terminal} --detach -T floating_shell ${shell} -c";
  conn_stats_script = "${pkgs.unixtools.ping}/bin/ping 8.8.8.8 -i 1 -c 5 -q | ${pkgs.gnused}/bin/sed -rn 's#([0-9]+) packets transmitted, ([0-9]+) received, ([0-9]+)% packet loss, time [0-9]+ms#{\"text\":\"\\2/\\1 Packets received, \\3% Packet loss\", \"alt\":\"\\2/\\1@\\3%\", \"tooltip\":\"\\2/\\1@\\3% packet loss\", \"class\":\"noclass\",\"percentage\":\\3}#p'";
  cores = {core}: if core == 0 then "{icon${toString core}}" else "${cores {core = (core - 1);}}{icon${toString core}}";
  load-bar = [" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
  load-bar-idle = ["-" "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
  bat-charge-bar = [ "󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
  bat-bar = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
  bar-height = 39;
  svg = (import ./scripts/tint_svg.nix { inherit pkgs; });
in
{
  layer = "top";
  position = "top";
  modules-left = [
    "sway/workspaces"
    ];
  modules-center = [
    #"clock#minimal"
    #"sway/mode"
    ];
  modules-right = [
    "image#seperator_left"
    "group/cpu_container"
    
    "image#seperator_middle"

    "group/gpu_container"

    "image#seperator_middle"
    
    "group/ram_container"
    "image#seperator_right"
    
    
    "image#seperator_left"
    "group/control_container"
    "image#seperator_right"

    #"custom/connectivity"
    #"network"
    
    "image#seperator_left"
    "clock"
    ];
  
  # --- Seperator Section ---

  "image#seperator_middle" = {
    # CSS has a margin (left, right) of 5px
    path = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-middle.svg; });
    size = bar-height;
  };

  "image#seperator_left" = {
    # CSS has a margin-left of 5px
    path = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-left.svg; });
    size = bar-height;
  };

  "image#seperator_right" = {
    # CSS has a margin-right of 15px
    path = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-right.svg; });
    size = bar-height;
  };
  
  # --- CPU Section ---

  "image#cpu" = {
    # CSS has a padding of 2px
    # TODO: mode switching
    exec = "${(import ./scripts/cpu_mode.nix { inherit pkgs; })}/bin/cpu_mode";
    interval = 10;
    size = bar-height - 8;
  };

  cpu = {
    interval = 1;
    format = "${(cores {core = 19; })}";
    format-icons = load-bar;
    states = {
      medium = 50;
      high = 70;
      extreme = 95;
    };
  };
  
  "group/cpu_container" = {
    orientation = "inherit";
    modules = [
      "image#cpu"
      "cpu"
    ];
  };
  
  # --- GPU Section ---

  "image#gpu" = {
    # CSS has a padding of 2px
    path = ./assets/gpu.svg;
    size = bar-height - 8;
  };

  "custom/gpu_utilization" = {
    exec = "${(import ./scripts/gpu_utilization.nix { inherit pkgs osConfig; })}/bin/gpu_utilization";
    return-type = "json";
    interval = 1;
    format = "{icon}";
    format-icons = load-bar-idle;
    tooltip = true;
    tooltip-format = "GPU Utilization {percentage} %";
  };

  "custom/gpu_vram_usage" = {
    exec = "${(import ./scripts/gpu_vram_usage.nix { inherit pkgs osConfig; })}/bin/gpu_vram_usage";
    return-type = "json";
    interval = 1;
    format = "{icon}";
    format-icons = load-bar-idle;
    tooltip = true;
    tooltip-format = "VRAM Usage {percentage} %";
  };
  
  "group/gpu_container" = {
    orientation = "inherit";
    modules = [
      "image#gpu"
      "custom/gpu_utilization"
      "custom/gpu_vram_usage"
    ];
  };

  # --- RAM Section ---

  "image#ram" = {
    # CSS has a padding of 2px
    path = ./assets/ram.svg;
    size = bar-height - 8;
  };
  
  memory = {
    format = "{icon}";
    tooltip = true;
    tooltip-format = "RAM Usage: {used}/{total}GB";
    format-icons = load-bar-idle;
    states = {
      medium = 50;
      high = 70;
      extreme = 95;
    };
  };
  
  "custom/swap" = {
    exec = "${(import ./scripts/swap_usage.nix { inherit pkgs; })}/bin/swap_usage";
    return-type = "json";
    interval = 1;
    format = "{icon}";
    format-icons = load-bar-idle;
    tooltip = true;
    tooltip-format = "Swap usage {percentage} %\n{text}GB";
  };
  
  "group/ram_container" = {
    orientation = "inherit";
    modules = [
      "image#ram"
      "memory"
      "custom/swap"
    ];
  };

  # --- Clock Section ---

  clock = {
    interval = 1;
    format = "{:%H:%M}";
    tooltip-format = "{%d.%m.%y}<tt><small>{calendar}</small></tt>";
    calendar = {
      mode = "month";
      week-pos = "right";
    };
  };
  
  # --- Control Section ---
  
  # brightness, loudness, chargedness

  backlight = {
    format = "{icon}";
    format-icons = [ "󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
    tooltip = true;
    tooltip-format = "{percent}%";
  };
  
  pulseaudio = {
    format = "Volume:\n{volume}%";
    format-icons = [ "󰕿" "󰖀" "󰕾"];
    format-muted = "󰖁";
    on-click = "${floating_shell} ${pulsemixer}";
    tooltip = true;
    tooltip-format = "{volume}%";
  };

  battery = {
    interval = 5;
    states = {
      caution = 30;
      critical = 10;
      danger = 5;
    };
    format = " {icon}";
    format-caution = " {icon}";
    format-critical = " {icon}";
    format-danger = " {icon}";
    format-charging = "󰚥{icon}";
    format-full = " {icon}";
    format-icons = bat-bar;
    tooltip = true;
    tooltip-format = "Battery at {capacity}%\nDrawing {power}W\n{timeTo}";
  };
  
  "group/control_container" = {
    orientation = "inherit";
    modules = [
      "backlight"
      "pulseaudio"
      "battery"
    ];
  };

  # connectivity, connection


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




}
