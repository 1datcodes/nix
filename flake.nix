{
	description = "Simple flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
	};

	outputs = { self, nixpkgs, ... }: {
		nixosConfigurations.intelmbp = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./configuration.nix ];
		};
	};
}


