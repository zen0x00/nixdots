{ pkgs, ... }:

{
  gtk.enable = true;
  gtk.iconTheme = {
    name = "Tela-circle";
    package = pkgs.tela-circle-icon-theme;
  };
}
