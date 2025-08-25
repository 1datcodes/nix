{ config, inputs, pkgs, ... }:
{
	# Wireless/Wi-Fi 
	networking.hostName = "nixos";
	networking.wireless.enable = false;
	networking.networkmanager.enable = true;

	# Bluetooth
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};

	# SSH
	services.openssh = {
		enable = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = true;
			AllowUsers = null;
		};
	};

	# Open ports in firewall
	networking.firewall.allowedTCPPorts = [ 22 ];
	networking.firewall.allowedUDPPorts = [ 22 ];
}
