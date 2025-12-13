{ pkgs, config, ... }:
{
  environment.systemPackages = [
    (import ./pkg-trace.nix { inherit pkgs; })
    (import ../programs/waybar/scripts/gpu_utilization.nix { pkgs = pkgs; osConfig = config; })
  ];
}
