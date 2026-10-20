{ pkgs, pkgs-unstable, ... }:

{
  services.ollama = {
    enable = true;
  };
  services.open-webui = {
    enable = true;
  };
}