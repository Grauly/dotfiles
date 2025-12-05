{ pkgs, pkgs-unstable, ... }:

let
  mc-depencencies = with pkgs; [
    libpulseaudio
    libGL
    glfw3-minecraft
    openal
    (lib.getLib stdenv.cc.cc)
  ];
in
pkgs.symlinkJoin {
  name = "IntelliJ Minecraft Support";
  paths = [ pkgs-unstable.jetbrains.idea-community ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/idea-community \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath mc-depencencies}
  '';
}
