{ pkgs, ... }: {
  home.packages = with pkgs; [
    firefox
    thunderbird
    discord
    bitwarden
    element-desktop
    blender
    prismlauncher
    vscode
    nixpkgs-fmt
    libsForQt5.dolphin
    jetbrains.idea-community
    mangohud
    pavucontrol
    xorg.xev
    evince
  ];
}
