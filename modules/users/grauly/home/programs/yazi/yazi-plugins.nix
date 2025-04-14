{ pkgs, lib, ... }:

let
  enabledCustomPlugins = [
    #"linemode"
  ];
  enabledGitPlugins = [
    {
      user = "Grauly";
      repo = "xdg-mime.yazi";
      hash = "sha256-vyLnfneOcm1YkNzWfCWxRkfOXNSRkYtHdKnJ3ZCS47c=";
    }
  ];
in
{
  home.file = (builtins.listToAttrs
    (map
      (plugin:
        lib.nameValuePair ".config/yazi/plugins/${plugin}.yazi/" {
          source = ./plugins/${plugin};
        }
      )
      enabledCustomPlugins)
  ) // (builtins.listToAttrs
    (map
      (plugin:
        lib.nameValuePair ".config/yazi/plugins/${plugin.repo}/" {
          source = (pkgs.fetchgit { url = "https://github.com/${plugin.user}/${plugin.repo}"; hash = "${plugin.hash}";}).outPath;      
        }
      )
      enabledGitPlugins)
  );
}
