{ pkgs, osConfig, ... }:

pkgs.writeShellApplication {
  name = "gpu_vram_usage";
  runtimeInputs = with pkgs; [
    coreutils
    gnused
    gnugrep
    osConfig.hardware.nvidia.package
  ];
  text = ''
  DUMP=$(nvidia-smi -q -d MEMORY)
  TOTAL=$(echo "$DUMP" | grep "Total" | head -n 1 | sed "s/.*Total.*: //" | sed "s/ MiB//")
  USED=$(echo "$DUMP" | grep "Used" | head -n 1 | sed "s/.*Used.*: //" | sed "s/ MiB//")
  PERCENTAGE="$(( (USED * 100) / TOTAL))"
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