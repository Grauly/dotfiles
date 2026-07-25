{ pkgs, pkgs-unstable, ... }:

rec {
  name = "glslls";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.enable('${name}')
    vim.lsp.config('${name}', {
      cmd = { '${pkgs.glslls}/bin/glslls', '--stdin' },
      on_attach = attach_lsp
    })
  '';
}