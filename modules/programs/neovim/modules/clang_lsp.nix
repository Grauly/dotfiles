{ pkgs, pkgs-unstable, ... }:

{
  name = "clang_lsp";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.config['clangd'] = {
      cmd = { '${pkgs.clang-tools}/bin/clangd' },
      
      on_attach = function(client, bufnr)
            vim.lsp.completion.enable(true, client.id, bufnr, {
              autotrigger = true,
              convert = function(item)
                return { abbr = item.label:gsub("%b()", "") }
              end,
            })
            vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
          end
    }
    vim.lsp.enable('clangd')
    vim.opt.completeopt = { "menuone", "noselect", "popup" } 
  '';
}