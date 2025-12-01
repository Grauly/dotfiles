{ pkgs, ... }:
{
  environment.systemPackages = [
    (import ./pkg-trace.nix { inherit pkgs; })
    (import ./xdg-terminal-workaround.nix { inherit pkgs; })
  ];
}
