{ home-manager, ... }:

{
  home-manager.users.grauly = import ./vscode.nix;
}
