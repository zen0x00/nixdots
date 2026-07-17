{ pkgs, ... }:

{
  fonts.packages = (with pkgs.nerd-fonts; [
    jetbrains-mono
    droid-sans-mono
  ]) ++ (with pkgs; [
    noto-fonts
    maple-mono.NF
  ]);

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Droid Sans Mono Nerd Font" "Noto Sans Telugu" ];
      serif = [ "Droid Sans Mono Nerd Font" "Noto Serif Telugu" ];
    };
  };
}
