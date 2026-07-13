{ pkgs, ... }:

{
  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    droid-sans-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Droid Sans Mono Nerd Font" ];
      serif = [ "Droid Sans Mono Nerd Font" ];
    };
  };
}
