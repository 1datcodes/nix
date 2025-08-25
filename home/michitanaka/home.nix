{ config, inputs, pkgs, ... }:
{
	imports = [
		../../modules/home
	];

	programs.home-manager.enable = true;

	home.stateVersion = "24.11";
}
