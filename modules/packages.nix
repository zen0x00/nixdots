{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    git           # optional, useful during installation
    wget
    curl
    libsecret     # libraries
    libimobiledevice
    ifuse
  ];
}
