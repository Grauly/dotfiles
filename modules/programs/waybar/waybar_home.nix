{ pkgs, osConfig, ... }:

let
  bar-height = 39;
  seperator_width = 17;
  svg_tint = (import ./scripts/tint_svg.nix { inherit pkgs; });
  render = (import ./scripts/render_svg.nix { inherit pkgs; });
  svg = { color, path }: (render { path = (svg_tint { inherit color path; }); height = bar-height; });
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = (import ./waybar_settings.nix { inherit pkgs osConfig bar-height; });
    };
    style = ((import ./scripts/process_css.nix { inherit pkgs; }) { 
      path = ./waybar_style.css;
      background_color = "rgba (40, 40, 40, 0.5)";
      #background_color = osConfig.grauly.colors.background;
      highlight_color = osConfig.grauly.colors.mix;
      text_color = osConfig.grauly.colors.text.color;
      bar_height = (builtins.toString bar-height);
      seperator_width = (builtins.toString seperator_width);
      img_sep_right = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-right.svg; });
      img_sep_left = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-left.svg; });
      img_sep_middle = (svg {color = osConfig.grauly.colors.mix; path = ./assets/seperator-middle.svg; });
      img_cpu = (render { path = ./assets/cpu.svg; height = (bar-height - 8); });
      img_gpu = (render { path = ./assets/gpu.svg; height = (bar-height - 8); });
      img_ram = (render { path = ./assets/ram.svg; height = (bar-height - 8); });
      });
  };
}
