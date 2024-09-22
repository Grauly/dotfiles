{ osConfig, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = (import ./alacritty.toml.nix { inherit osConfig; });
  };
}
