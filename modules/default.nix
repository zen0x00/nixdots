{ ... }:

{
  imports = [
    ./nix.nix
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./home-manager.nix

    ./xserver.nix
    # ./niri.nix
    ./hyprland.nix
    ./nvidia.nix

    ./hardware.nix
    ./audio.nix
    ./services.nix
    ./security.nix
    ./gaming.nix
    ./fonts.nix
    ./packages.nix
  ];
}
