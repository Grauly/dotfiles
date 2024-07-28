{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      gnome = super.gnome.overrideScope' (gself: gsuper: {
        nautilus = gsuper.nautilus.overrideAttrs (nsuper: {
          buildInputs = nsuper.buildInputs ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
        });
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services = {
    gnome.sushi.enable = true;
    gvfs.enable = true;
  };
}
