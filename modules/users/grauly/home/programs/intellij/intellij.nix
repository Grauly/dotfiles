{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (import ./intellij_WL.nix { inherit pkgs; })
  ];

  home.file = {
    ".jdks/openjdk17".source = "${pkgs.jdk17}/lib/openjdk";
    ".jdks/openjdk21".source = "${pkgs.jdk21}/lib/openjdk";
  };
}

