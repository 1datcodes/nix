{ config, inputs, pkgs, ... }:
{
	programs.wofi = {
		enable = true;
		settings = {
			show = "drun";
			"allow_images" = true;
			width = 1000;
			height = 600;
			"always_parse_args" = true;
			"show_all" = false;
			term = "kitty";
			"hide_scroll" = true;
			"print_command" = true;
			insensitive = true;
			prompt = "";
			columns = 1;
			style = "/home/michitanaka/.config/wofi/style.css";
		};
	};
}
