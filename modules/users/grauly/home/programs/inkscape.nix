{ pkgs, ... }:

{
  home.packages = [
    (pkgs.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs.inkscape-extensions; [
        silhouette
      ];
    })
  ];
}
