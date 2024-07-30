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
        hostname = "sfz-aalen.space";
        port = 29;
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
        ];
      };
      sfzserver-intern = {
        host = "sfzserver-intern";
        user = "debian";
        hostname = "10.20.42.162";
        identityFile = [
          "~/.ssh/id_ed25519_sfzkey.key"
        ];
      };
    };
  };
}
