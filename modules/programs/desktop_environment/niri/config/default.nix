{ pkgs, config, osConfig, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshot_%Y-%m-%d_%H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;
      input = (import ./inputs.nix);
      outputs = (import ./outputs.nix);
      layout = (import ./layouts.nix { inherit osConfig; });
      window-rules = (import ./window_rules.nix { inherit osConfig; });
      binds = (import ./keybinds.nix { inherit pkgs config osConfig; });
    };
  };
  
  home.packages = with pkgs; [
    xwayland-satellite
    wl-clipboard
  ];
}