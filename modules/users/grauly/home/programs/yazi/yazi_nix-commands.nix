{ pkgs, config, lib, ... }:

let
  cfg = config.yazi.nix-commands;
in
{ 
  options.yazi.nix-commands = {
    enable = lib.mkEnableOption "Enable yazi nix commands";

    commands = lib.mkOption {
      default = [];
      type = lib.types.listOf ( lib.types.submodule ({ config, ...}: {
        options = {
          enable = lib.mkEnableOption "Enable this specific command";
          name = lib.mkOption {
            description = "The variable name of this command";
            type = lib.types.str;
          };
          command = lib.mkOption {
            description = "The command string";
            type = lib.types.str;
          };
        };
      }));
      description = "Definitions of yazi nixxed commands";
    };
  };

  #now actually do the stuff
  config = lib.mkIf cfg.enable {
    xdg.configFile."yazi/plugins/nix-commands.yazi/main.lua".text = 
    ''
    return {
      entry = function()

      end,
      commands = {
    '' +
    (lib.concatLines (builtins.map (c:
      ''${c.name} = "${c.command}",''
    ) (builtins.filter (c: c.enable) cfg.commands))) + 
    ''
      }
    }
    '';
  };
}
