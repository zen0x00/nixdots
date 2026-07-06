{ pkgs, ... }:

let
  kittyConfig = pkgs.writeText "kitty.conf" ''
    font_family JetBrainsMono Nerd Font Mono
    font_size 13

    cursor_shape block
    cursor_shape_unfocused hollow
    cursor_trail 1

    background_opacity 0.97

    detect_urls yes
    show_hyperlink_targets no
    underline_hyperlinks hover

    hide_window_decorations yes

    window_padding_width 14 14
    single_window_margin_width 30 0 0 0
  '';
in
{
  system.activationScripts.kittyConfig = ''
    install -Dm644 ${kittyConfig} /home/aman/.config/kitty/kitty.conf
    chown aman:users /home/aman/.config/kitty/kitty.conf
  '';
}
