{
  imports = [
    ./gtk.nix
    ./gtk_file-picker-fix.nix
  ];
  home-manager.users.grauly = {
    gtk.enable = true;
    imports = [
      ./cursor
    ];
  };
}
