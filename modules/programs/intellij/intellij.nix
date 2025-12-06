{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    #(import ./intellij_WL.nix { inherit pkgs pkgs-unstable; })
    pkgs-unstable.jetbrains.idea-community
  ];

  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
    ".jdks/jetbrainsjdk".source = "${pkgs.jetbrains.jdk}/lib/openjdk";
  };
}

