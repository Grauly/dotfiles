{ pkgs-blender, ... }:

{
  home.packages = with pkgs-blender;[
    (blender.override {
      cudaSupport = true;
    })
    cudatoolkit
  ];
}
