{ config, inputs, pkgs, ... }:
{
	home.packages = with pkgs; [
		discord
		legcord
		spotify
		brave
		_1password-gui
		qimgv
		vscode
		kitty
	];
}
