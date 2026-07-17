{
  flake.modules.nixos.nvidia =
    { ... }:

    {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      hardware.nvidia = {
        open = true;

        modesetting.enable = true;

        powerManagement.enable = true;
      };

      environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "nvidia";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      };
    }
;
}
