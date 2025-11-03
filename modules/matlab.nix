{ pkgs, ...}: 

{
  # not actually matlab, but its use is for matlab.
  # you know matlab is fucked when every single source is telling you "don't"
  # but here we are.
  # ...and hell followed at a leisurly stroll
  
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [ pkgs.distrobox ];
}