{ config, inputs, pkgs, ... }:
{
	catppuccin = {
		flavor = "mocha";
		accent = "lavender";
		cursors = {
			enable = true;
			flavor = "mocha";
			accent = "dark";
		};
		swaync = {
			enable = true;
			flavor = "mocha";
			font = "JetBrains Mono Nerd Font";
		};
	};
}
