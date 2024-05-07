{
  home.shellAliases = {
    ll = "ls -lah";
    lsstick = "lsblk | grep -v  \"nvme\"";
    mntstick = "() {udisksctl mount -b \"/dev/\$1\"}";
    umntstick = "() {udisksctl unmount -b \"/dev/\$1\"}";
    lsmntstick = "ls /run/media/grauly/";
    reswitch = "sudo nixos-rebuild switch --flake /home/grauly/dotfiles#thetanix";
    reswitch-boot = "sudo nixos-rebuild boot --flake /home/grauly/dotfiles#thetanix";
    rsrc = "source ~/.zshrc";
    rebar = "systemctl --user restart waybar";
    reswitch-bar = "reswitch; rebar";
  };
}
