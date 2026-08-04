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
  paths = [ pkgs-unstable.jetbrains.idea ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/idea \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath mc-depencencies} \
  '';
}
