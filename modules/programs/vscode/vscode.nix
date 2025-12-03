{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = (import ./vscode-WL-electron.nix { inherit pkgs; });
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = (import ./settings.json.nix { inherit pkgs; });
      extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        sumneko.lua
        jnoortheen.nix-ide
      ];
    };
  };
}
