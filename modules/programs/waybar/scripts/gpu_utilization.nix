{ pkgs, osConfig, ... }:

pkgs.writeShellApplication {
  name = "gpu_utilization";
  runtimeInputs = with pkgs; [
    coreutils
    gnused
    gnugrep
    osConfig.hardware.nvidia.package
  ];
  text = ''
  PERCENTAGE=$(nvidia-smi -q -d UTILIZATION | grep "GPU .* :" | sed "s/.*GPU.*: //" | sed "s/ %//")
  CLASS=""
  if (( PERCENTAGE > 50 )); then
    CLASS="medium"
  fi
  if (( PERCENTAGE > 70 )); then
    CLASS="high"
  fi
  if (( PERCENTAGE > 95 )); then
    CLASS="extreme"
  fi
  echo "{\"percentage\": $PERCENTAGE, \"class\": \"$CLASS\"}"
  '';
}