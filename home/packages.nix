{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # CLI utilities
    bat
    codex
    curl
    fd
    git
    grc
    jq
    fastfetch
    nixfmt
    ripgrep
    wget

    # Browser
    librewolf

    # Terminal
    kitty

    # Theming
    pywalfox-native

    # Editors
    neovim
    vscode

    # Desktop
    signal-desktop
    xwayland-satellite

    # iPhone
    ifuse
    libimobiledevice

    # Libraries
    libsecret

    # Flake packages
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
