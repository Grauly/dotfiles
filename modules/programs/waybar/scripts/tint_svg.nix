{ pkgs, ... }:

{ color, path }: pkgs.runCommand "tint_svg" {} ''
  SUBSTITUTE_PATTERN='fill:#ffffff;fill-opacity:1'
  RAW_ALPHA=$( echo $(( $(echo "${color}" | sed "s/#....../0x/") )) )
  # make sure if the color code does not contain alpha information, it just assumes full opacity
  # also kinda makes sure I am not trying to display entierly transparent stuff
  if (( $RAW_ALPHA == 0 )); then
    RAW_ALPHA=255
  fi
  ALPHA=$(( RAW_ALPHA * 100 / 255 ))
  # pad out the actual value
  ALPHA=$(echo "00$ALPHA")
  # place the dot
  ALPHA=$(echo $ALPHA | sed -E "s/([0-9]{2})$/.\1/" | sed -E "s/0*([1-9]?[0-9]\..*)/\1/")
  COLOR=$( echo "${color}" | sed -E "s/(#......).*/\1/" )
  echo "got past calculations"
  echo '${builtins.readFile path}' | sed "s/$SUBSTITUTE_PATTERN/fill:$COLOR;fill-opacity:$ALPHA/g" > $out
''