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
      path = "/";
    }
    {
      user = "Grauly";
      repo = "dragon.yazi";
      hash = "sha256-hrdMHdZqyr8sWnlPesXmDN+O3Uj1KmAV/dNi3/2VLIo=";
      path = "/";
    }
    {
      user = "yazi-rs";
      repo = "plugins";
      hash = "sha256-m3709h7/AHJAtoJ3ebDA40c77D+5dCycpecprjVqj/k=";
      path = "/mount.yazi/";
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
        lib.nameValuePair "yazi/plugins/${if(plugin.path == "/") then plugin.repo else plugin.path}/" {
          source = "${(pkgs.fetchgit { url = "https://github.com/${plugin.user}/${plugin.repo}"; hash = "${plugin.hash}"; }).outPath}${plugin.path}";
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
        command = "${pkgs.xdragon}/bin/dragon-drop";
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
