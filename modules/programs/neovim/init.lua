vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.nu = true
vim.o.cursorline = true
vim.o.autoindent = true
vim.o.autocomplete = true;
vim.o.sw = 4
vim.cmd "colorscheme vim"
vim.opt.clipboard = 'unnamedplus'

vim.diagnostic.enable = true
vim.diagnostic.config({
virtual_lines = true,
})

-- lsp setup

attach_lsp = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub("%b()", "") }
      end,
    })
    vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
    vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, { desc = "open hover info" })
  end

vim.opt.completeopt = { "menuone", "noselect", "popup" }