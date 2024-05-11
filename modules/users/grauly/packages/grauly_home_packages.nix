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
    jetbrains.idea-community
    mangohud
    pavucontrol
    xorg.xev
    evince
    gnome.eog
    xfce.thunar
    gvfs
    tree
  ];
}
