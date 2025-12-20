{ pkgs, config, ... }:

let
  homeDir = config.home-manager.users.grauly.home.homeDirectory;
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
        "${homeDir}/.local/PrismLauncher"
      ];
      extraBackupArgs = [
        "-v"
      ];
      timerConfig = null;
      backupCleanupCommand = ''
          echo "$(${pkgs.coreutils}/bin/date +%s)" > "${homeDir}/.local/backup-timestamp.txt"
        '';
    };
  };
}