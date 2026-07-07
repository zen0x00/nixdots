{ pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/hyprland
    ./programs/fish.nix
    ./programs/fastfetch.nix
    ./packages.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.callPackage ../modules/sunset-cursors.nix {};
    name = "Sunset-Cursors";
    size = 24;
  };

  home.username = "aman";
  home.homeDirectory = "/home/aman";
  home.stateVersion = "26.05";
  programs.man.generateCaches = false;
  programs.home-manager.enable = true;
}
