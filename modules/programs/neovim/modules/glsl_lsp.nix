{ pkgs, pkgs-unstable, ... }:

rec {
  name = "glslls";
  plugins = (with pkgs.vimPlugins; []);
  extra-packages = (with pkgs; []);
  lua-config = ''
    vim.lsp.config('${name}', {
      cmd = { '${pkgs.glslls}/bin/glslls', '--stdin' },
      
      on_attach = function(client, bufnr)
            vim.lsp.completion.enable(true, client.id, bufnr, {
              autotrigger = true,
              convert = function(item)
                return { abbr = item.label:gsub("%b()", "") }
              end,
            })
            vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
          end
    })
    vim.lsp.enable('${name}')
    vim.opt.completeopt = { "menuone", "noselect", "popup" } 
  '';
}