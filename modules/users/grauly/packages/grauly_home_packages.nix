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
    xfce.tumbler
    gvfs
    tree
    texstudio
    texliveFull
    libsForQt5.konsole
    obs-studio
    vesktop
    libreoffice-qt
    grim
    slurp
    imagemagick
    zip
    qrencode
    gnome.zenity
    icoutils
    gimp
    vlc
  ];
}
