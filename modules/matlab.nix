{ pkgs, ... }:

{
  # not actually matlab, but its use is for matlab.
  # you know matlab is fucked when every single source is telling you "don't"
  # but here we are.
  # ...and hell followed at a leisurly stroll

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["grauly"];

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };

  virtualisation.spiceUSBRedirection.enable = true;
}
