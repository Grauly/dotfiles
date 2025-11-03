{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (prismlauncher.override {
      #glfw3-minecraft = (import ./glfw-minecraft { inherit pkgs; });
    })
  ];
}