{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # Pinned pre-2.18 nixpkgs, used only to grab an older fontconfig build.
    # fontconfig 2.18.x ships 48-guessfamily.conf with `xsi:nil` attrs that
    # its own XML parser doesn't understand, spamming startup logs.
    nixpkgs-fontconfig-fix.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, nixpkgs-fontconfig-fix, ... }:
    {
      nixosConfigurations.bit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          {
            nixpkgs.overlays = [
              (final: prev: {
                fontconfig = nixpkgs-fontconfig-fix.legacyPackages.${prev.system}.fontconfig;
              })
            ];
          }
          ./hosts/bit/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
