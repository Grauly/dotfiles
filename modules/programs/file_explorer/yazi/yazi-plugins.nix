{ pkgs, lib, ... }:

let
  enabledCustomPlugins = [
    #"linemode"
  ];
  enabledGitPlugins = [
    {
      user = "Grauly";
      repo = "dragon.yazi";
      hash = "sha256-CApGYs/+6LFE5r+xb7+F0oF9qy7AtCPvIKkfzFRgnQc=";
      path = "/";
    }
    {
      user = "yazi-rs";
      repo = "plugins";
      hash = "sha256-TtVaWazkk2xnomhJFinElbUsXUKAbDDhLEVq5Ah3nAk=";
      path = "/mount.yazi/";
    }
    {
      user = "yazi-rs";
      repo = "plugins";
      hash = "sha256-TtVaWazkk2xnomhJFinElbUsXUKAbDDhLEVq5Ah3nAk=";
      path = "/types.yazi/";
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
      {
        enable = true;
        name = "gdbus";
        command = "${pkgs.glib}/bin/gdbus";
      }
    ];
  };
}
