{ pkgs, osConfig, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      grauly = (import ./waybar_settings.nix { inherit pkgs osConfig; });
    };
    style = ((import ./scripts/process_css.nix { inherit pkgs; }) { 
      path = ./waybar_style.css;
      background_color = "rgba (40, 40, 40, 0.5)";
      #background_color = osConfig.grauly.colors.background;
      highlight_color = osConfig.grauly.colors.mix;
      text_color = osConfig.grauly.colors.text.color;
      });
  };
}
