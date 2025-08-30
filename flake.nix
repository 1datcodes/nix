{
	description = "A simple flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations.m1air = nixpkgs.lib.nixosSystem {
			system = "aarch64-linux";
			modules = [ ./configuration.nix ];
		};
	};
}
