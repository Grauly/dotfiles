{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-24.05";
    };
    nixpkgs-unstable = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-blender = {
      url = "nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-blender, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      #setup packages to only use my system, and configure them to use unfree
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      pkgs-blender = import nixpkgs-blender {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        thetanix = lib.nixosSystem {
          inherit system pkgs;
          modules = [
            ./modules/modules.nix
            ./hardware/hardware.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit pkgs-blender;
              };
            }
          ];
        };
      };
    };
}
