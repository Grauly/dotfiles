{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.borealis-cursors;
    name = "Borealis-cursors";
    gtk.enable = true;
  };
}
