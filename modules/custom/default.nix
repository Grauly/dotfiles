{ pkgs, ... }:
{
  environment.systemPackages = [
    (import ./pkg-trace.nix { inherit pkgs; })
  ];
}
