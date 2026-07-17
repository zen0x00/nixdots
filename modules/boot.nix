{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    configurationLimit = 10;
    theme = "${pkgs.fetchFromGitHub {
      owner = "sandesh236";
      repo = "sleek--themes";
      rev = "e103aa4cd655be6a38dbab37b1911c6ed9ef7765";
      hash = "sha256-E3DSOZlszBRy2F172L7ZSSsDlkk3n9jGXl4hRWv2WF8=";
    }}/Sleek theme-light/sleek";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
