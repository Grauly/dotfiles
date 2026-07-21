{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      VDPAU_DRIVER = "va_gl";
      LIBVA_DRIVER_NAME = "nvidia";
    };
    systemPackages = with pkgs; [
      nvtopPackages.nvidia
    ];
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    nvidia = {
      #branch = "new_feature";
      
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version            = "610.43.03";
        sha256_64bit       = "sha256-ReLUwTSiPDXlDyU6SqY+fl6NF+PRhdSgfIpY6WEu05I=";
        sha256_aarch64     = "sha256-jSdlXo60ilXLKWKvZfgbBnVqVYuw6zhnGuiDgwxYz94=";
        openSha256         = "sha256-QCXmqo2xNyIwjGv0da2MUC8ex641Mmc5DUI+uRFVwgE=";
        settingsSha256     = "sha256-z/t+SdEQdVJPwjKIRHO02d264Kt47eWiOwwsaxmh4xQ=";
        persistencedSha256 = "sha256-sOKUsAFHh0/COH+nNgbH9+7hWgivOzq4YmTuk9MOFfI=";
      };
      
      open = true;

      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };


}

