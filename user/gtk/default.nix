{
  home-manager.users.grauly = {
    gtk.enable = true;
    imports = [
      ./cursor
      ./gtk_file-picker-fix.nix
      ./gtk.nix
    ];
  };
}