{ lib, ... }:

{
  options.grauly = {
    terminal = with lib; {
      standalone = mkOption {
        type = type.str;
        description = "Path to the terminal executable";
      };
      detach = mkOption {
        type = type.str;
        description = "Command to execute the terminal to run a specific binary, detatched (append the specifics to this)";
      };
    };
  };
}