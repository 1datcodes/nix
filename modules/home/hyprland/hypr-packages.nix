{ config, inputs, pkgs, ... }:
{
	home.packages = with pkgs; [
		waybar
		wofi
		hyprpaper
		hypridle
		hyprlock
		hyprcursor
		hyprshot
		playerctl
		pavucontrol
		wlogout
	];
}
