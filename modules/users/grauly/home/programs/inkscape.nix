{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    (pkgs.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs-unstable.inkscape-extensions; [
        silhouette
        inkstitch
      ];
    })
  ];
}
