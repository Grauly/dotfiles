{ inputs, ... }:

{
  environment.systemPackages = [
    inputs.nixpkgs-blender.packages.x86_64-linux.default
  ];
}
