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
      
      "gitlab.uni-ulm.de" = {
        hostname = "gitlab.uni-ulm.de";
        identityFile = [
          "~/.ssh/gitlabkey_uni"
        ];
      };

      sfzserver-aux = {
        host = "sfzserver-aux";
        user = "grauly";
        hostname = "100.64.0.5";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver-aux-intern = {
        host = "sfzserver-aux-intern";
        user = "grauly";
        hostname = "10.20.42.78";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver-aux-builder = {
        host = "sfzserver-aux-builder";
        user = "root";
        hostname = "100.64.0.5";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver-aux-builder-intern = {
        host = "sfzserver-aux-builder";
        user = "root";
        hostname = "10.20.42.78";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };

      sfzserver-builder = {
        host = "sfzserver-builder";
        user = "root";
        hostname = "100.64.0.76";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver-builder-intern = {
        host = "sfzserver-builder-intern";
        user = "root";
        hostname = "10.20.42.79";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver = {
        host = "sfzserver";
        user = "grauly";
        hostname = "100.64.0.76";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
      sfzserver-intern = {
        host = "sfzserver-intern";
        user = "grauly";
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
