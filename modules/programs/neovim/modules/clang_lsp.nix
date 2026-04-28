{ pkgs, pkgs-unstable, ... }:

{
  name = "clang_lsp";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.config['clangd'] = {
      cmd = { '${pkgs.clang}' },
    }
    vim.lsp.enable('clangd')
  '';
}