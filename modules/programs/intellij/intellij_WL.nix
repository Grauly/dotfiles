{ pkgs, pkgs-unstable, ... }:

let
  mc-depencencies = with pkgs; [
    libpulseaudio
    libGL
    glfw3-minecraft
    openal
    stdenv.cc.cc.lib
  ];
in
pkgs.symlinkJoin {
  name = "IntelliJ Minecraft Support";
  paths = [ pkgs-unstable.jetbrains.idea-community ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/idea-community \
      --add-flag -Dawt.toolkit.name=WLToolkit \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath mc-depencencies}
  '';
}
