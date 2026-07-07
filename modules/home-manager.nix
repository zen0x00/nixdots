{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "bkp";

    extraSpecialArgs = {
      inherit inputs;
    };

    users.aman = import ../home/aman.nix;
  };
}
