{
  imports = [
    ./gtk.nix
    ./gtk_file-picker-fix.nix
  ];
  
  programs.dconf.enable = true;

  home-manager.users.grauly = {
    gtk.enable = true;
    
    imports = [
      ./cursor
    ];
  };
}
