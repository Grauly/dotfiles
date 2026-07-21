{ pkgs, ... }:
let
  notify = "${pkgs.libnotify}/bin/notify-send";
  nh-os = "${pkgs.nh}/bin/nh os";
in
{
  home.shellAliases = {
    ll = "ls -lah";
    lsg = "ls -lah | grep";
    lsstick = "lsblk | grep -v  \"nvme\"";
    mntstick = "() {udisksctl mount -b \"/dev/\$1\"}";
    umntstick = "() {udisksctl unmount -b \"/dev/\$1\"}";
    lsmntstick = "ls /run/media/grauly/";
    reswitch = "${nh-os} switch /home/grauly/dotfiles#thetanix && ${notify} 'Switch complete'";
    reswitch-boot = "${nh-os} boot /home/grauly/dotfiles#thetanix && ${notify} 'Switch complete, ready at next boot'";
    retest = "${nh-os} test /home/grauly/dotfiles#thetanix && ${notify} 'Test build complete and deployed'";
    rsrc = "source ~/.zshrc";
    rebar = "systemctl --user restart waybar";
    reswitch-bar = "reswitch; rebar";
    ssh-ag = "eval \"$(ssh-agent -s)\"; ssh-add ~/.ssh/githubkey; ssh-add ~/.ssh/gitlabkey";
    open = "xdg-open";
    calc = "rofi -show calc";
    psg = "ps -xf | grep";
    ssh = "kitty +kitten ssh";
    ssh-nk = "${pkgs.openssh}/bin/ssh";
  };
}
