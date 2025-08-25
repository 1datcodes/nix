{ config, inputs, pkgs, ... }:
{
	# Hypridle
	services.hypridle = {
		enable = true;
		settings = {
			general = {
				"lock_cmd" = "pidof hyprlock || hyprlock";
				"before_sleep_cmd" = "loginctl lock-session 2";
				"after_sleep_cmd" = "hyprctl dispatch dpms on";
				"ignore_dbus_inhibit" = false;
			};

			listener = [
				{
					timeout = 230;
					on-timeout = "notify-send 'Locking Screen in 30s'";
				}
				{
					timeout = 300;
					on-timeout = "hyprlock && loginctl lock-session 2";
				}
				{
					timeout = 330;
					on-timeout = "hyprctl dispatch dpms off";
					on-resume = "hyprctl dispatch dpms on";
				}
			];
		};
	};
}
