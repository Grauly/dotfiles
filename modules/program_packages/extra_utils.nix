{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    ../programs/system_information.nix
    ../programs/printing.nix
    ../programs/wireshark.nix
  ];
  
  environment.systemPackages = with pkgs; [
    pavucontrol
    xev
    tree
    killall
    cryfs
    fzf
    ripgrep
    nmap
    systemctl-tui
    
    remmina
    nh
  ];
}
