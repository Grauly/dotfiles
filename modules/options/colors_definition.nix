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
      background-3 = mkOption {
        type = types.str;
        description = "Hex code with #, only RGB, not alpha, should be the same as background";
      };
      background-border = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      background-border-3 = mkOption {
        type = types.str;
        description = "Hex code with #, only RGB, not alpha, should be the same as background";
      };
      highlight = mkOption {
        type = types.str;
        description = "Hex code with #";
      };
      error = mkOption {
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
        lowlight = mkOption {
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
      border-width = mkOption {
        type = types.int;
        description = "Border width, hopefully in pixels";
      };
      window-spacing = mkOption {
        type = types.int;
        description = "Spacing of Windows";
      };
      opacity = mkOption {
        type = types.float;
        description = "Opacity, if hex code opacity is not working, 0 = transparent";
      };
      blur = mkOption {
        type = types.int;
        description = "Blur factor";
      };
    };
  };
}
