{ pkgs, ... }:

{
  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    droid-sans-mono
  ];
}
