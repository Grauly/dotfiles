{ pkgs, ... }:

(pkgs.glfw3-minecraft.overrideAttrs (finalAttrs: previousAttrs: {
  pname = "glfw3-minecraft-wayland";
  src = pkgs.fetchgit {
    url = "https://github.com/llyyr/glfw-minecraft-wayland";
    hash = "sha256-gO/X/Rpf50c3GnX2pUNdeBiT9ugWtQVJnj9YHufkFd8=";
  };
  patches = pkgs.glfw3.patches
  ++ [
    ./0009-Defer-setting-cursor-position-until-the-cursor-is-lo.patch
  ];
}))