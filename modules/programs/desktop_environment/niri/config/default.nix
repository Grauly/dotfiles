{ pkgs, config, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshot_%Y-%m-%d_%H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;
      input = (import ./inputs.nix);
      output = (import ./outputs.nix);
      layout = (import ./layouts.nix { inherit config; });
      window-rules = (import ./window_rules.nix);
      binds = (import ./keybinds.nix { inherit pkgs config; });
    };
  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
  ];
}