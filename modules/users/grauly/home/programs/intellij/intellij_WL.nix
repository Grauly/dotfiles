{ pkgs, ... }:

let
  mc-depencencies = with pkgs; [
    libpulseaudio
    libGL
    (import ../glfw-minecraft { inherit pkgs; })
    openal
    stdenv.cc.cc.lib  
  ];
in
pkgs.symlinkJoin {
  name = "IntelliJ Minecraft Support";
  paths = [ pkgs.jetbrains.idea-community];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/idea-community \
      --add-flag -Dawt.toolkit.name=WLToolkit \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath mc-depencencies}
  '';
}