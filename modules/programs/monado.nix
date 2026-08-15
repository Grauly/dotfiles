{ pkgs, pkgs-unstable, config, home-manager, ... }:

{
  services.monado = {
    enable = true;
    defaultRuntime = true;
  };

  environment.systemPackages = with pkgs-unstable; [
    monado-vulkan-layers
    basalt-monado
  ];

  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
    WMR_HANDTRACKING = "0";
    XRT_COMPOSITOR_FORCE_WAYLAND_DIRECT="1";
  };
  
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  
  hardware.steam-hardware.enable = true;

  boot.kernelPatches = [
    {
      name = "amdgpu-ignore-ctx-privileges";
      patch = pkgs.fetchpatch {
        name = "cap_sys_nice_begone.patch";
        url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
        hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
      };
    }
  ];
  
  # OpenXR discovery
  home-manager.users.grauly.xdg.configFile."openxr/1/active_runtime.json".source =
    "${config.services.monado.package}/share/openxr/1/openxr_monado.json";

  home-manager.users.grauly.xdg.configFile."openvr/openvrpaths.vrpath".text = builtins.toJSON {
    config = [ "${config.home-manager.users.grauly.xdg.dataHome}/Steam/config" ];
    external_drivers = null;
    jsonid = "vrpathreg";
    log = [ "${config.home-manager.users.grauly.xdg.dataHome}/Steam/logs" ];
    runtime = [ "${config.services.monado.package}/share/st-openvr" ];
    version = 1;
  };

}