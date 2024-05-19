{ osConfig, ...}:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      enable_audio_bell = false;
      background = osConfig.grauly.colors.background-3;
      background_opacity = (toString osConfig.grauly.style.opacity);
      background_blur = osConfig.grauly.style.blur;
    };
  };
}