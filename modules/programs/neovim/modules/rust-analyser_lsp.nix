{ pkgs, pkgs-unstable, ... }:

rec {
  name = "rust_analyzer";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.enable('${name}')
    vim.lsp.config('${name}', {
      cmd = { '${pkgs.rust-analyzer}/bin/rust-analyzer' },
      on_attach = attach_lsp
    })
  '';
}