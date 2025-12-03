{ pkgs, ... }:

{
  "extensions.autoCheckUpdates" = false;
  "update.mode" = "none";
  "extensions.experimental.affinity" = {
    "asvetliakov.vscode-neovim" = 1;
  };
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = "${pkgs.nil}/bin/nil";
}
