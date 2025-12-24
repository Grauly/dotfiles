{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # removed, because it is again causing problems. I should be fine tho
    # package = (import ./vscode-WL-electron.nix { inherit pkgs; });
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = (import ./settings.json.nix { inherit pkgs; });
      extensions = with pkgs.vscode-extensions; [
        asvetliakov.vscode-neovim
        sumneko.lua
        jnoortheen.nix-ide
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "KDL";
          publisher = "kdl-org";
          version = "2.1.3";
          sha256 = "sha256-Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
        }
      ];
    };
  };
}
