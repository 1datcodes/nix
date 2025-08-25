{ config, inputs, pkgs, ...}:
{
	# Enable X11 windowing system
	services.xserver = {
		enable = true;
		videoDrivers = [ "modesetting" ];
	};

	# Enable KDE Plasma DE
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# Hyprland WM
	programs.hyprland = {
		enable = true;
		# Use the flake
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
		# Use UWSM
		withUWSM = true;
		# Enable XWayland
		xwayland.enable = true;
	};
}
