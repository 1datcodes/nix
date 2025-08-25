{ config, inputs, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		../../modules/system
	];

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# State Version. DO NOT CHANGE
	system.stateVersion = "24.11";
}
