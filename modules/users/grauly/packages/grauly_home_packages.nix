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
    xfce.thunar
    jetbrains.idea-community
    mangohud
    swayrbar
  ];
}
