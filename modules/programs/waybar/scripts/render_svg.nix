{ pkgs, ... }:

{ path, height }: pkgs.runCommand "render_svg.png" {
    buildInputs = with pkgs; [ resvg inkscape ];
} ''
    inkscape --export-filename=$out --export-height=${builtins.toString height} ${path} 
''