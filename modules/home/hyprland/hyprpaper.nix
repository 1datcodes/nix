{ config, inputs, pkgs, ... }:
{
	# Hyprpaper
	services.hyprpaper = {
		enable = true;

		settings = {
			preload = [
				"/home/michitanaka/Wallpaper/harbor.jpg"
			];

			wallpaper = [
				", /home/michitanaka/Wallpaper/harbor.jpg"
			];
		};
	};
}
