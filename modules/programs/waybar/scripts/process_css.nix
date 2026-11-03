{ pkgs, ... }:

{ path,
  background_color,
  highlight_color,
  text_color,
  bar_height,
  img_height,
  seperator_width,
  img_sep_right,
  img_sep_left,
  img_sep_middle,
  img_cpu,
  img_gpu,
  img_ram,
}: pkgs.runCommand "process_css" {} ''
  echo '${builtins.readFile path}' |\
   sed "s/\"§background_color\"/${background_color}/g" |\
   sed "s/\"§highlight_color\"/${highlight_color}/g" |\
   sed "s/\"§text_color\"/${text_color}/g" |\
   sed "s/\"§bar_height\"/${bar_height}px/g" |\
   sed "s/\"§img_height\"/${img_height}px/g" |\
   sed "s/\"§seperator_width\"/${seperator_width}px/g" |\
   sed "s#§img_sep_right#${img_sep_right}#g" |\
   sed "s#§img_sep_left#${img_sep_left}#g" |\
   sed "s#§img_sep_middle#${img_sep_middle}#g" |\
   sed "s#§img_cpu#${img_cpu}#g" |\
   sed "s#§img_gpu#${img_gpu}#g" |\
   sed "s#§img_ram#${img_ram}#g" \
   > $out
''