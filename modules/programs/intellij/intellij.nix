{ pkgs, pkgs-unstable, ... }:

{
  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
    ".jdks/openjdk25".source = "${pkgs.jdk25}/lib/openjdk";
    ".jdks/jetbrainsjdk21".source = "${pkgs.jetbrains.jdk-21}/lib/openjdk";
    ".jdks/jetbrainsjdk25".source = "${pkgs.jetbrains.jdk}/lib/openjdk";
  };
}

