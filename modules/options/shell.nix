{ lib, config, ... }:

{
  options.grauly = {
    shell = with lib; {
      standalone = mkOption {
        type = type.str;
        description = "Path to the shell executable";
        default = lib.getExe config.users.users.grauly.shell;
      };
      launch-program = mkOption {
        type = type.str;
        description = "Command to execute the shell to run a specific binary (append the specifics to this)";
      };
    };
  };
}