{ config, ... }:

with config.grauly; let
  active = {
    gradient = {
      from = colors.gradient-from;
      to = colors.gradient-to;
      relative-to = "window";
      in' = "oklab";
    };
  };
  inactive = {
    color = colors.background-border;
  };
  urgent = {
    color = colors.highlight;
  };
  window-sizes = [
    { proportion = 0.05; }
    { proportion = 0.1; }
    { proportion = 0.33333; }
    { proportion = 0.5; }
    { proportion = 0.66667; }
    { proportion = 1.0; }
  ];
in { 
  empty-workspace-above-first = true;
  gaps = style.border-width + style.window-spacing;
  always-center-single-column = true;
  default-column-display = "normal";
  preset-column-widths = window-sizes;
  default-column-width = {};
  preset-window-heights = window-sizes;
  tab-indicator = {
    enable = true;
    gap = style.border-width + style.window-spacing;
    position = "top";
    gaps-between-tabs = style.border-width + style.window-spacing;
    corner-radius = style.border-radius;
    active = active;
    inactive = inactive;
    urgent = urgent;
  };
  focus-ring = {
    enable = true;
    width = style.border-width * 4;
    active = active;
    inactive = inactive;
    urgent = urgent;
  };
  border = {
    enable = true;
    width = style.border-width;
    active = active;
    inactive = inactive;
    urgent = urgent;
  };
}