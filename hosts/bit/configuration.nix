{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/locale.nix
    ../../modules/users.nix
    ../../modules/home-manager.nix

    ../../modules/xserver.nix
    ../../modules/hyprland.nix
    ../../modules/nvidia.nix

    ../../modules/hardware.nix
    ../../modules/services.nix
    ../../modules/security.nix
    ../../modules/gaming.nix
    ../../modules/fonts.nix
    ../../modules/packages.nix
  ];

  networking.hostName = "bit";

  system.stateVersion = "26.05";
}
