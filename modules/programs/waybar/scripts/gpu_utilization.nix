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
    echo "{\"percentage\": $PERCENTAGE, \"tooltip\": \"GPU Utilization: $PERCENTAGE %\"}"
  '';
}