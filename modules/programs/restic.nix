{ pkgs, config, ... }:

let
  homeDir = config.users.users.grauly.homeDirectory;
in{
  services.restic.backups = {
    "base" = {
      user = "grauly";
      initialize = true;
      passwordFile = "/home/grauly/.ssh/restic_password.txt";
      repository = "/run/media/grauly/backup/ResticBackups";
      paths =  [
        "${homeDir}/Documents"
        "${homeDir}/.ssh"
      ];
      timerConfig = null;
      backupCleanupCommand = ''
          echo "$(${pkgs.coreutils}/bin/date +%s)" > "${homeDir}/.local/backup-timestamp.txt"
        '';
    };
  };
}