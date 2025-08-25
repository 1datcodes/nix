{ config, inputs, pkgs, ...}:

{
	# Bootloader/Systemd
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	# Load i2c-dev
	boot.kernelModules = [ "i2c-dev" ];

	# amdgpu driver
	boot.kernelParams = [
		"amdgpu.dc=1"
		"amdgpu.dpm=1"
		"radeon.si_support=0"
		"radeon.cik_support=0"
		"amdgpu.si_support=1"
		"amdgpu.cik_support=1"
	];

	# OpenGL
	hardware.graphics.enable = true;

	# Allow Broadcom drivers
	nixpkgs.config.permittedInsecurePackages = [
		"broadcom-sta-6.30.223.271-57-6.12.43"
	];

	# Add ddcutil to sudoers
	security.sudo = {
		enable = true;
		extraRules = [{
			users = [ "michitanaka" ];
			commands = [{
				command = "${pkgs.ddcutil}/bin/ddcutil";
				options = [ "NOPASSWD" ];
			}];
		}];
	};

	# Add swap memory
	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 32 * 1024;
	}];
}
