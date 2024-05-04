{ pkgs, ... }:

{
  users.users.grauly.packages = with pkgs; [
    #effectivly useless if you have a home-manager running
  ];
}
