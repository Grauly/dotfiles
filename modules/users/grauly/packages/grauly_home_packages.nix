{ pkgs, pkgs-unstable, ... }: {
  home.packages = with pkgs; [
    firefox
    thunderbird
    element-desktop
    prismlauncher
    vscode
    nixpkgs-fmt
    mangohud
    pavucontrol
    xorg.xev
    evince
    gnome.eog
    tree
    texstudio
    texliveFull
    libsForQt5.konsole
    obs-studio
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
  ] ++ (with pkgs-unstable; [
    #https://github.com/bitwarden/clients/issues/8759
    bitwarden-desktop
    prusa-slicer
    vesktop
  ]);
}
