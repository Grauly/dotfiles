{ pkgs, ... }:

(pkgs.glfw3-minecraft.overrideAttrs (finalAttrs: previousAttrs: {
  pname = "glfw3-minecraft-wayland";
  src = pkgs.fetchgit {
    url = "https://github.com/llyyr/glfw-minecraft-wayland";
    hash = "sha256-gO/X/Rpf50c3GnX2pUNdeBiT9ugWtQVJnj9YHufkFd8=";
  };
  patches = [
    # yes, I basically patch the thing in the other patch patches out
    # I just could not find a way to patch the patch without having a duplicate of the entire nixpkgs flying around
    # (and even then I could not figure out how to get the package out of there)
    # so, this is the best for now.
    # the patch in question:
    # https://github.com/NixOS/nixpkgs/blob/nixos-25.05/pkgs/by-name/gl/glfw3/0009-Defer-setting-cursor-position-until-the-cursor-is-lo.patch
    ./patch-in-for-patch-out.patch
  ] ++ previousAttrs.patches;
}))