{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    jetbrains.idea-community-bin
  ];

  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
  };

  # to enable actually starting MC from dev env, taken from  https://discourse.nixos.org/t/issues-with-opengl-in-minecraft-development-environments/37532/10
  home.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      pkgs.libglvnd
      pkgs.pulseaudio
    ];
  };
}

