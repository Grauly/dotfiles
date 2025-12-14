{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "swap_usage";
  runtimeInputs = with pkgs; [
    coreutils
    gnused
    gnugrep
    procps
    getconf
  ];
  text = ''
  DUMP=$(free | tail -n 1 | sed "s/Swap: *//" | sed "s/ /\n/g" | sed "/^ *$/d")
  PAGE_SIZE=$(getconf "PAGE_SIZE")
  SUPER_BLOCK_CUTOUT=$(( PAGE_SIZE / 1024 ))
  # Account for the super block in the swap
  TOTAL=$(( $(echo "$DUMP" | head -n 1 ) + SUPER_BLOCK_CUTOUT ))
  USED=$(echo "$DUMP" | head -n 2 | tail -n 1)
  PERCENTAGE="$(( (USED * 100) / TOTAL ))"
  # Calculate The Actual GiB based usages
  USED_GB=$(( USED * 100 / 1024 ** 2 ))
  # Pad out the number for the next step to work
  USED_GB="00$USED_GB"
  # RegEx Black Magic to: a) set a . before the last two digits, b) strip out leading irrelevant 0's
  USED_GB=$(echo $USED_GB | sed -E "s/([0-9]{2})$/.\1/" | sed -E "s/0*([1-9]?[0-9]\..*)/\1/")
  # Repeat of the above
  TOTAL_GB=$(( TOTAL * 100 / 1024 ** 2 ))
  TOTAL_GB="00$TOTAL_GB"
  TOTAL_GB=$(echo $TOTAL_GB | sed -E "s/([0-9]{2})$/.\1/" | sed -E "s/0*([1-9]?[0-9]\..*)/\1/")
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
  echo "{\"percentage\": $PERCENTAGE, \"text\": \"$USED_GB/$TOTAL_GB\", \"class\": \"$CLASS\"}"
  '';
}