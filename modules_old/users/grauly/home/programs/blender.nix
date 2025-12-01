{ inputs, ... }:

{
  home.packages = [
    inputs.nixpkgs-blender.packages.x86_64-linux.default
  ];
}
