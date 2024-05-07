{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    thunderbird
    discord
    bitwarden
    element-desktop
    blender
    inkscape
    prismlauncher
    vscode
    nixpkgs-fmt
    libsForQt5.dolphin
    jetbrains.idea-community
    mangohud
    pavucontrol
    kitty
    xorg.xev
  ];
}
