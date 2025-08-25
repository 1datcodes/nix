{ config, inputs, pkgs, ...}:
{
	# Timezone
	time.timeZone = "America/Los_Angeles";

	# Select internationalisation properties
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Japanese input method
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.waylandFrontend = true;
		fcitx5.addons = with pkgs; [
			fcitx5-mozc
			kdePackages.fcitx5-qt
		];
	};

	# QMK
	hardware.keyboard.qmk.enable = true;
}
