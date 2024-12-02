{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
      fzf
    ];
    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.o.relativenumber = true
      vim.o.nu = true
      vim.o.cursorline = true
      vim.o.autoindent = true
      vim.cmd "colorscheme vim" 
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable", -- latest stable release
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)
      plugins = {
      	{
          'nvim-telescope/telescope.nvim', tag = '0.1.6',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
          "smoka7/multicursors.nvim",
          event = "VeryLazy",
          dependencies = {
              'smoka7/hydra.nvim',
          },
          opts = {},
          cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
          keys = {
                    {
                      mode = { 'v', 'n' },
                      '<Leader>m',
                      '<cmd>MCstart<cr>',
                      desc = 'Create a selection for selected text or word under the cursor',
                    },
                  },
        }
      }
      require("lazy").setup(plugins, opts)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.opt.clipboard = 'unnamedplus'
    '';
  };
}
