{
	description = "A simple flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
		apple-silicon = {
			url = "github:nix-community/nixos-apple-silicon/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, apple-silicon, ... }: {
		nixosConfigurations.m1air = nixpkgs.lib.nixosSystem {
			system = "aarch64-linux";
			modules = [ ./configuration.nix ];
		};
	};
}
