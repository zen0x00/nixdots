{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:

    {
      gtk.enable = true;
      gtk.theme = {
        name = "Abyssal-Catppuccin";
      };
      xdg.configFile."gtk-3.0/settings.ini".force = true;
      xdg.configFile."gtk-4.0/settings.ini".force = true;

      gtk.iconTheme = {
        name = "Tela-circle";
        package = pkgs.tela-circle-icon-theme;
      };
    }
;
}
