{ pkgs, pkgs-unstable, ... }:

{
  name = "telescope";
  plugins = (with pkgs.vimPlugins; [
    telescope-nvim
  ]);
  extra-packages = (with pkgs; []);
  lua-config = (builtins.readFile ./telescope.lua);
}