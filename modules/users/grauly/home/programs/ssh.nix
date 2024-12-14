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

      sfzserver = {
        host = "sfzserver";
        user = "debian";
        hostname = "100.64.0.64";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
        ];
      };
      sfzserver-intern = {
        host = "sfzserver-intern";
        user = "debian";
        hostname = "10.20.42.78";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
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
        hostname = "fd7a:115c:a1e0::1e";
        identityFile = [
          "~/.ssh/linkkey"
        ];
      };
    };
  };
}
