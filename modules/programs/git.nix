{
  home-manager,
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.grauly =
    let
      mail = "nils.dellemann@web.de";
      user = "Grauly";
      signingkey = "${config.home-manager.users.grauly.home.homeDirectory}/.ssh/signingkey.pub";
      allowedSignersFile = "${config.home-manager.users.grauly.home.homeDirectory}/.ssh/allowed_signers";
    in
    {
      programs.git = {
        enable = true;
        settings = {
          user = {
            email = mail;
            name = user;
          };
          push.autoSetupRemote = true;
          init.defaultBranch = "main";
          gpg.ssh.allowedSignersFile = allowedSignersFile;
        };
        signing = {
          signByDefault = true;
          format = "ssh";
          key = signingkey;
        };
      };
    };
}
