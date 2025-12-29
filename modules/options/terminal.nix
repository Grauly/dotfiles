{ lib, config, ... }:

let
  cfg = config.grauly.terminal;
in
{
  options.grauly = {
    terminal = with lib; rec {
      package = mkOption {
        type = types.package;
        description = "Package of the terminal";
      };
      standalone = mkOption {
        type = types.str;
        description = "Path to the terminal executable";
        default = lib.getExe cfg.package;
      };
      detach = mkOption {
        type = types.listOf types.str;
        description = "Command to execute the terminal to run a specific binary, each argument a entry in the list, detatched (append the specifics to this)";
      };
      detach-string = mkOption {
        type = types.str;
        description = "Command to execute the terminal to run a specific binary, detatched (append the specifics to this)";
        default = lib.strings.concatStringsSep " " cfg.detach;
      };
    };
  };
  
  config = {
    environment.systemPackages = [
      cfg.package
    ];
  };
}