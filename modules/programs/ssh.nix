{ home-manager, ... }:

{
  home-manager.users.grauly.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = [
          "~/.ssh/githubkey"
        ];
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        identityFile = [
          "~/.ssh/gitlabkey"
        ];
      };
      "codeberg.org" = {
        hostname = "codeberg.org";
        identityFile = [
          "~/.ssh/codebergkey"
        ];
      };
      
      "gitlab.uni-ulm.de" = {
        hostname = "gitlab.uni-ulm.de";
        identityFile = [
          "~/.ssh/gitlabkey_uni"
        ];
      };

      gamescom-aux = {
        host = "gamescom-aux";
        user = "grauly";
        hostname = "100.64.0.5";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-aux-intern = {
        host = "gamescom-aux-intern";
        user = "grauly";
        hostname = "10.20.42.78";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-aux-builder = {
        host = "gamescom-aux-builder";
        user = "root";
        hostname = "100.64.0.5";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-aux-builder-intern = {
        host = "gamescom-aux-builder";
        user = "root";
        hostname = "10.20.42.78";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };

      gamescom = {
        host = "gamescom";
        user = "grauly";
        hostname = "100.64.0.25";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-intern = {
        host = "gamescom-intern";
        user = "grauly";
        hostname = "10.20.42.79";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-builder = {
        host = "gamescom-builder";
        user = "root";
        hostname = "100.64.0.25";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      gamescom-builder-intern = {
        host = "gamescom-builder-intern";
        user = "root";
        hostname = "10.20.42.79";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };

      link = {
        host = "link";
        user = "grauly";
        hostname = "100.64.0.1";
        identityFile = [
          "~/.ssh/linkkey"
        ];
      };
      parry-print = {
        host = "parry";
        user = "root";
        hostname = "10.12.42.89";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      octoprint = {
        host = "octoprint";
        user = "root";
        hostname = "10.20.42.45";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      matekasse = {
        host = "matekasse";
        user = "root";
        hostname = "10.10.42.156";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      foodbot = {
        host = "foodbot";
        user = "user";
        hostname = "sfz-aalen.space";
        port = 300;
        identityFile = [
          "~/.ssh/foodkey"
        ];
      };
    };
  };
}
