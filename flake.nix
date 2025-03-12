{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    lanzaboote = {
	url = "github:nix-community/lanzaboote/v0.4.2";
	};
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
	}; 
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
};

  outputs = { self, nixpkgs,nixos-cosmic, lanzaboote, home-manager, stylix, nvf, ... }: {
 nixosConfigurations = {
      # NOTE: change "host" to your system's hostname
      nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";       
          modules = [
          home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.cotunjr = import ./home-manager/home.nix;
	}
  	lanzaboote.nixosModules.lanzaboote
	nvf.nixosModules.default
           ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/var/lib/sbctl";
            };
          })
            {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          nixos-cosmic.nixosModules.default
           stylix.nixosModules.stylix
	   ./home-manager/dot.nix
          ./configuration.nix
        ];
      };
    };
  };
}
