{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = [
    (pkgs.inkscape-with-extensions.override {
      inkscapeExtensions = with pkgs-unstable.inkscape-extensions; [
        silhouette
        inkstitch
      ];
    })
    pkgs.adwaita-icon-theme
  ];
}
