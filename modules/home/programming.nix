{ config, inputs, pkgs, ... }:
{
	home.packages = with pkgs; [
		nodejs_22
		python3
		gnumake
	];
}
