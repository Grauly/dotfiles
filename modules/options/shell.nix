{ lib, config, ... }:

let
  cfg = config.grauly.shell;
in
{
  options.grauly = {
    shell = with lib; {
      package = mkOption {
        type = types.package;
        description = "Package of the shell";
      };
      standalone = mkOption {
        type = types.str;
        description = "Command to execte the shell";
        default = lib.getExe cfg.package;
      };
      launch-program = mkOption {
        type = types.listOf types.str;
        description = "Command to execute the shell to run a specific binary (each argument a entry in the list), append the specifics to this";
      };
      launch-string = mkOption {
        type = types.str;
        description = "Command to execute the shell to run a specific binary, as string. append the specifics to this";
        default = lib.strings.concatStringsSep " " cfg.launch-program;
      };
    };
  };
  
  config = {
    users.users.grauly = {
      shell = cfg.package;
    };
  };
}