{ pkgs-unstable, ... }:

{
  home.packages = [
    (pkgs-unstable.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs-unstable.inkscape-extensions; [
        silhouette
      ];
    })
  ];
}
