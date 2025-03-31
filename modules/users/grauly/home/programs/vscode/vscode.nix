{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    userSettings = (import ./settings.json.nix);
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      sumneko.lua
    ];
  };
}
