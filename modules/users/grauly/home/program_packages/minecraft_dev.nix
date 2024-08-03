{ pkgs, pkgs-unstable, ...}:

{
  imports = [
    ../programs/intellij.nix
    ./core_utils.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    blockbench
    gimp
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    bitwarden-desktop
  ]);
}