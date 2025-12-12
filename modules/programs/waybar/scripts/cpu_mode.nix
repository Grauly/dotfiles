{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "cpu_mode";
  runtimeInputs = with pkgs; [
    coreutils
  ];
  text = ''
    MODE="$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | uniq)"
    case $MODE in
      powersave)
        printf "${../assets/cpu-powersave.svg}\nPowersave"
        ;;
      performance)
        printf "${../assets/cpu-performance.svg}\nPerformance"
        ;;
      *)
        printf "${../assets/cpu.svg}\nCould not determine govener"
        ;;
    esac
  '';
}