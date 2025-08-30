{ config, inputs, pkgs, ... }:
{
	# Waybar
	programs.waybar = {
		enable = true;

		systemd = {
			enable = true;
		};

		settings = {
			# Start with minimal config
			mainBar = {
				layer = "top";
				position = "top";

				height = 50;
				
				modules-left = [
					"hyprland/workspaces"
				];

				modules-center = [
					"custom/music"
				];

				modules-right = [
					"pulseaudio"
					"clock"
					"custom/notification"
					"tray"
					"custom/lock"
					"custom/power"
				];

				"hyprland/workspaces" = {
					"disable-scroll" = true;
					"all-outputs" = true;
					"sort-by-name" = true;
					"format" = "{name} {icon}";
					"format-icons" = {
						# "active" = "";
						"default" = "";
					};
				};

				"tray" = {
					"icon-size" = 21;
					"spacing" = 10;
				};

				"custom/music" = {
					"format" = "  {}";
					"escape" = true;
					"interval" = 5;
					"tooltip" = false;
					"exec" = "playerctl metadata --format='{{ title }}'";
					"on-click" = "playerctl play-pause";
					"max-length" = 50;
				};

				"clock" = {
					"interval" = 1;
					"tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					"format-alt" = "󰃭 {:%m/%d/%Y}";
					"format" = "  {:%H:%M:%S}";
					"calendar" = {
						"mode" = "month";
					};
				};

				"pulseaudio" = {
					"format" = "{icon} {volume}%";
					"format-bluetooth" = "{volume}% {icon}";
					"format-bluetooth-muted" = " {icon}";
					"format-icons" = {
					   "headphone" = "";
					   "hands-free" = "";
					   "headset" = "";
					   "phone" = "";
					   "portable" = "";
					   "car" = "";
					   "default" = ["" "" ""];
					};
					"on-click" = "pavucontrol";
				};

				"custom/lock" = {
					"tooltip" = false;
					"on-click" = "sh -c '(sleep 0.5s; hyprlock)' & disown";
					"format" = "";
				};

				"custom/power" = {
					"tooltip" = false;
					"on-click" = "wlogout &";
					"format" = "⏻";
				};

				"custom/notification" = {
					"tooltip" = false;
					"format" = "{icon}";
					"format-icons" = {
						"notification" = "<span foreground='red'><sup></sup></span>";
						"none" = "";
						"dnd-notification" = "<span foreground='red'><sup></sup></span>";
						"dnd-none" = "";
						"dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
						"dnd-inhibited-none" = "";
					};
					"return-type" = "json";
					"exec-if" = "which swaync-client";
					"exec" = "swaync-client -swb";
					"on-click" = "swaync-client -t -sw";
					"on-click-right" = "swaync-client -d -sw";
					"escape" = true;
				};
			};
		};
	};
}
