{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "bit";

  system.stateVersion = "26.05";
}
