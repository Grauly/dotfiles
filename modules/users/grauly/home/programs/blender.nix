{ inputs, pkgs-blender, ... }:

{
  #  home.packages = with pkgs-blender;[
  #    (blender.override {
  #      cudaSupport = true;
  #    })
  #    cudatoolkit
  #  ];
  home.packages = [
    pkgs-blender.packages.x86_64-linux.blender_4_3
  ];
}
