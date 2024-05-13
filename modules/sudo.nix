{ pkgs, ... }:

{
  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "${config.system.build.nixos-rebuild}/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
  };
}
