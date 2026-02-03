{ pkgs, pkgs-unstable, ... }:

{
  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
    ".jdks/jetbrainsjdk".source = "${pkgs.jetbrains.jdk}/lib/openjdk";
    #".jdks/jetbrainsjdk25".source = "${import ./jbr25.nix { pkgs = pkgs; withJcef = false; }}/lib/openjdk";
  };
}

