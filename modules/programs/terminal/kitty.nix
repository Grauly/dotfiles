{ home-manager, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
  ];

  home-manager.users.grauly.programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";     
      size = 15;
    };
    settings = {
      enable_audio_bell = false;
      background = config.grauly.colors.background-3;
      background_opacity = (toString config.grauly.style.opacity);
      background_blur = config.grauly.style.blur;
    };
  };
}
