{ ... }:

{
  imports = [
    ./programs
    ./packages.nix
    ./mime.nix
  ];

  home.username = "aman";
  home.homeDirectory = "/home/aman";
  home.stateVersion = "26.05";
  home.sessionPath = [ "$HOME/.local/bin" ];
  programs.man.generateCaches = false;
  programs.home-manager.enable = true;
}
