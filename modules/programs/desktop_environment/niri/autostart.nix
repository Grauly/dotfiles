{ pkgs, ... }:
{
  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd}/bin/agreety --cmd \"nvidia-offload niri-session\"";
      };
    };
  };
  
  systemd.user.services.niri.enableDefaultPath = false;
}