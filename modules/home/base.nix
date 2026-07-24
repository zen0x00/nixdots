{
  flake.modules.homeManager.base = {
    home.username = "aman";
    home.homeDirectory = "/home/aman";
    home.stateVersion = "26.05";
    home.sessionPath = [ "$HOME/.local/bin" ];
    programs.man.generateCaches = false;
    programs.home-manager.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
