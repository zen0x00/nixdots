{ pkgs, ... }:

{

  home.file.".config/fastfetch/config.jsonc".source =
    ../../files/fastfetch/config.jsonc;

  home.file.".config/fastfetch/logo.webp".source =
    ../../files/fastfetch/logo.webp;
}
