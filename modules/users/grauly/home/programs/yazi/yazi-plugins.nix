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
  xdg.configFile = (builtins.listToAttrs
    (map
      (plugin:
        lib.nameValuePair "yazi/plugins/${plugin}.yazi/" {
          source = ./plugins/${plugin};
        }
      )
      enabledCustomPlugins)
  ) // (builtins.listToAttrs
    (map
      (plugin:
        lib.nameValuePair "yazi/plugins/${plugin.repo}/" {
          source = (pkgs.fetchgit { url = "https://github.com/${plugin.user}/${plugin.repo}"; hash = "${plugin.hash}";}).outPath;      
        }
      )
      enabledGitPlugins)
  );
  yazi.nix-commands = {
    enable = true;
    commands = [
      {
        enable = true;
        name = "dragon";
        command = "${pkgs.xdragon}/bin/dragon";
      }
      {
        enable = true;
        name = "wget";
        command = "${pkgs.wget}/bin/wget";
      }
      {
        enable = true;
        name = "ls";
        command = "${pkgs.coreutils}/bin/ls";
      }
      {
        enable = true;
        name = "cp";
        command = "${pkgs.coreutils}/bin/cp";
      }
    ];
  };
}
