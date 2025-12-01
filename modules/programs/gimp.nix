{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp-with-plugins
  ] ++ (with pkgs.gimpPlugins; [
    gmic
  ]);
}
