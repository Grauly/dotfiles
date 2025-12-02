{
  imports = [
    ./gtk.nix
    ./gtk_file-picker-fix.nix
  ];
  home-manager.users.grauly = {
    gtk.enable = true;
    home.packages = with pkgs; [
      # apparently needed, but why is it only now an issue?
      dconf
    ];
    
    imports = [
      ./cursor
    ];
  };
}
