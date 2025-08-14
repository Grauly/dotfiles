{
  programs.ssh = {
    enable = true;
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
      sfzserver-fast = {
        host = "sfzserver-fast";
        proxyJump = "sfzserver";
        user = "nils";
        hostname = "10.20.42.179";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
        ];
      };
      sfzserver-intern-fast = {
        host = "sfzserver-intern-fast";
        user = "nils";
        hostname = "10.20.42.179";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
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
        hostname = "10.12.42.165";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
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
        hostname = "10.10.42.120";
        identityFile = [
          "~/.ssh/sfzkey"
        ];
      };
    };
  };
}
