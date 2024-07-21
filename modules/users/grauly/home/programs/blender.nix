{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable;[
    (blender.override {
      cudaSupport = true;
    })
    cudatoolkit
  ];
}
