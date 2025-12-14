{ pkgs, config, ... }:
{
  environment.systemPackages = [
    (import ./pkg-trace.nix { inherit pkgs; })
    (import ../programs/waybar/scripts/gpu_utilization.nix { pkgs = pkgs; osConfig = config; })
    (import ../programs/waybar/scripts/gpu_vram_usage.nix { pkgs = pkgs; osConfig = config; })
    (import ../programs/waybar/scripts/swap_usage.nix { inherit pkgs; })
  ];
}
