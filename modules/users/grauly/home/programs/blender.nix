{ inputs, ... }:

{
  home.packages = [
    inputs.nixpkgs-blender.packages.x86_64-linux.blender_4_3
  ];
}
