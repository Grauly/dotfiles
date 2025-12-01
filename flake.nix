{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-25.05";
    };
    nixpkgs-unstable = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-blender = {
      url = "github:edolstra/nix-warez?dir=blender";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, treefmt-nix, agenix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      #setup packages to only use my system, and configure them to use unfree
      treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
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
    in
    {
      formatter.${system} = treefmtEval.config.build.wrapper;
      nixosConfigurations = {
        thetanix = lib.nixosSystem {
          inherit system pkgs;
          modules = [
            ./modules
            ./hardware
            ./user
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit pkgs-unstable;
                inherit inputs;
              };
            }
            agenix.nixosModules.default
            {
              environment.systemPackages = [
                agenix.packages."${system}".default
              ];
            }
          ];
        };
      };
    };
}
