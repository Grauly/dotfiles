{ pkgs, pkgs-unstable, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };
  services.open-webui = {
    enable = true;
  };
}