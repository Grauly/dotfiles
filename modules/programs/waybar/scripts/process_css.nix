{ pkgs, ... }:

{ path, background_color, highlight_color, text_color }: pkgs.runCommand "tint_svg" {} ''
  echo '${builtins.readFile path}' | sed "s/\"§background_color\"/${background_color}/g" | sed "s/\"§highlight_color\"/${highlight_color}/g" | sed "s/\"§text_color\"/${text_color}/g" > $out
''