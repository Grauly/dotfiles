{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = {
        layer = "top";
        position = "top";
        modules-left = ["sway/workspaces"];
        modules-center = ["clock#minimal" "sway/window"];
        modules-right = ["cpu" "memory" "network" "pulseaudio" "backlight" "battery" "clock"];

        battery = {
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
          format = "{:%H:%M:%S\n%d.%m.%y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            week-pos = "right";
          };
        };

        "clock#minimal" = {
          format = "{:%H:%M}";
        };

        network = {
          format = "";
          format-ethernet = "ETH: {ipaddr}";
          tooltip-format-ethernet = "@ {bandwidthUpBytes} up,{bandwidthDownBytes} down";
          format-wifi = "WIFI: {essid} @ {signalStrength}/{ipaddr}";
          tooltip-format-wifi = "@ {bandwidthUpBytes} up,{bandwidthDownBytes} down";
          format-linked = "LINK LOST";
          format-disconnect = "SIGNAL LOST";
          on-click = "zsh -c 'nmtui'";
        };

        cpu = {
          format = "CPU: {usage}% @ {avg_frequency}mHz";
          states = {
            ok = 50;
            in-use = 70;
            warning = 90;
            critical = 100;
          };
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
          on-click = "pavucontrol";
        };

        backlight = {
          format = "Brightness:\n{percent}%";
        };
      };
    };
  };
}