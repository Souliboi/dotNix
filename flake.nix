{
  description = "NixSoup";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    leftwm = {
      url = "github:leftwm/leftwm";
    };
  };

  outputs = {nixpkgs, leftwm, ... }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };

      overlays = [
        leftwm.overlays.default
      ];
    };

    lib = nixpkgs.lib;
  in{
      nixosConfigurations = {
        NixVM = lib.nixosSystem {
	  inherit system pkgs;

	  modules = [
	    ./configuration.nix
	  ];
	};
      };
  };
}
