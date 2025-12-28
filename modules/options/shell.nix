{ lib, config, ... }:

let
  cfg = config.grauly.shell;
in
{
  options.grauly = {
    shell = with lib; rec {
      package = mkOption {
        type = type.derivation;
        description = "Package of the shell";
      };
      standalone = mkOption {
        type = types.listOf type.str;
        description = "Path to the shell executable";
        default = lib.getExe package;
      };
      launch-program = mkOption {
        type = type.str;
        description = "Command to execute the shell to run a specific binary (each argument a entry in the list), append the specifics to this)";
      };
      launch-string = lib.strings.concatStringsSep " " launch-program;
    };
  };
  
  config = {
    users.users.grauly = {
      shell = cfg.package;
    };
  };
}