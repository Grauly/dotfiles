{ home-manager, pkgs, pkgs-unstable, ... }:

let
  wantedPlugins = [
    (import ./modules/telescope.nix { inherit pkgs pkgs-unstable; })
    (import ./modules/clang_lsp.nix { inherit pkgs pkgs-unstable; })
  ];
in {
  environment.systemPackages = with pkgs; [
    neovim
  ];

  home-manager.users.grauly.programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    defaultEditor = true;
    extraPackages = (with pkgs; [
      ripgrep
      fd
      fzf
    ] ++ (pkgs.lib.lists.flatten (map (obj: obj.extra-packages) wantedPlugins)));
    plugins = (pkgs.lib.lists.flatten (map (obj: obj.plugins) wantedPlugins));
    extraLuaConfig = pkgs.lib.strings.concatStrings [''
      vim.g.mapleader = " "
      vim.o.relativenumber = true
      vim.o.nu = true
      vim.o.cursorline = true
      vim.o.autoindent = true
      vim.o.autocomplete = true;
      vim.o.sw = 4
      vim.cmd "colorscheme vim" 
      vim.opt.clipboard = 'unnamedplus'

    ''
    (pkgs.lib.strings.concatMapStrings (obj: "require('modules.${obj.name}')\n") wantedPlugins)
    ];
  };
  
  home-manager.users.grauly.xdg.configFile = builtins.listToAttrs (map (obj: {
    name = "nvim/lua/modules/${obj.name}.lua";
    value = {
      text = obj.lua-config;
    };
  }) wantedPlugins);
}
