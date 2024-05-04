{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    btop
    zsh
  ];
}
