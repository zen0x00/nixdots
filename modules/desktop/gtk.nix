{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:

    {
      gtk.enable = true;
      # DMS dynamic theming targets adw-gtk3 (writes gtk-3.0/gtk.css overrides)
      gtk.theme = {
        name = "adw-gtk3";
        package = pkgs.adw-gtk3;
      };
      # DMS rewrites these at runtime; force so rebuilds don't fail on stale .bkp
      xdg.configFile."gtk-3.0/settings.ini".force = true;
      xdg.configFile."gtk-4.0/settings.ini".force = true;

      gtk.iconTheme = {
        name = "Tela-circle";
        package = pkgs.tela-circle-icon-theme;
      };
    }
;
}
