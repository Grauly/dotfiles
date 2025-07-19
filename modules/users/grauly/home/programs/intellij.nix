{ pkgs, ... }:

let 
  mc-depencencies = with pkgs; [
    libpulseaudio
    libGL
    glfw
    openal
    stdenv.cc.cc.lib  
  ];
in 
{
  home.packages = with pkgs; [
    (pkgs.symlinkJoin {
      name = "IntelliJ Minecraft Support";
      paths = [ pkgs.jetbrains.idea-community];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/idea-community \
          --add-flag -Dawt.toolkit.name=WLToolkit \
          --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath mc-depencencies}
      '';
    })
  ];

  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
  };
}

