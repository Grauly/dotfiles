{ lib, config, ... }:

let
  cfg = config.grauly.terminal;
in
{
  options.grauly = {
    terminal = with lib; rec {
      package = mkOption {
        type = type.derivation;
        description = "Package of the terminal";
      };
      standalone = mkOption {
        type = type.str;
        description = "Path to the terminal executable";
        default = lib.getExe package;
      };
      detach = mkOption {
        type = type.listof type.str;
        description = "Command to execute the terminal to run a specific binary, each argument a entry in the list, detatched (append the specifics to this)";
      };
      detach-string = lib.strings.concatStringsSep " " detach;
    };
  };
  
  config = {
    environment.systemPackages = [
      cfg.package
    ];
  };
}