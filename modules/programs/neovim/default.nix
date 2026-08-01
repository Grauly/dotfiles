{ home-manager, pkgs, pkgs-unstable, ... }:

let
  wantedPlugins = [
    (import ./modules/telescope.nix { inherit pkgs pkgs-unstable; })
    (import ./modules/clang_lsp.nix { inherit pkgs pkgs-unstable; })
    (import ./modules/glsl_lsp.nix { inherit pkgs pkgs-unstable; })
    (import ./modules/rust-analyser_lsp.nix { inherit pkgs pkgs-unstable; })
  ];
in {
  environment.systemPackages = with pkgs; [
    neovim
  ];

  home-manager.users.grauly.programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = (with pkgs; [
      
    ] ++ (pkgs.lib.lists.flatten (map (obj: obj.extra-packages) wantedPlugins)));
    plugins = (pkgs.lib.lists.flatten (map (obj: obj.plugins) wantedPlugins)) ++ (with pkgs.vimPlugins; [
      nvim-lspconfig
    ]);
    initLua = pkgs.lib.strings.concatStrings [
      (builtins.readFile(./init.lua))
      (pkgs.lib.strings.concatMapStrings (obj: "require('modules.${obj.name}')\n") wantedPlugins)
    ];
    withRuby = true;
    withPython3 = true;
  };
  
  home-manager.users.grauly.xdg.configFile = builtins.listToAttrs (map (obj: {
    name = "nvim/lua/modules/${obj.name}.lua";
    value = {
      text = obj.lua-config;
    };
  }) wantedPlugins);
}
