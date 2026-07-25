{ pkgs, pkgs-unstable, ... }:

rec {
  name = "clangd";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.enable('${name}')
    vim.lsp.config('${name}', {
      cmd = { '${pkgs.clang-tools}/bin/clangd' },
      on_attach = attach_lsp
    })
  '';
}