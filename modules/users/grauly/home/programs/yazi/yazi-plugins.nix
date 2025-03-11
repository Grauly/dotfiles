{ pkgs, lib, ... }:

let
  enabledCustomPlugins = [
    "linemode"
  ];
in
{
#  home.file = (builtins.listToAttrs
#    (map
#      (plugin:
#        lib.nameValuePair ".config/yazi/plugins/${plugin}.yazi/" {
#          source = ./plugins/${plugin};
#        }
#      )
#      enabledCustomPlugins)
#  );
}
