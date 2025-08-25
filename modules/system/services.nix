{ config, inputs, pkgs, ...}:
{
	# Enable printing via CUPS
	services.printing.enable = true;
	services.avahi = {
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};

	# Enable sound with pipewire
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		audio.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	# VIAL udev
	services.udev.packages = [ pkgs.via ];
}
