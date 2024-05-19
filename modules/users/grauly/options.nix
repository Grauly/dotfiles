{ pkgs, lib, ... }:

{
  options.grauly = {
    colors = with lib; {
      gradient-from = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      gradient-to = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      mix = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      background = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      text = {
        color = mkOption {
          type = types.str;
          description = "Hex code with #";
        };
        highlight = mkOption {
          type = types.str;
          description = "Hex code with #";
        };
      };
    };
    style = with lib; {
      border-radius = mkOption {
        type = types.int;
        description = "Border radius, assumedly in pixels (the void help me if anyone does not use pixels)";
      };
    };
  };
}
