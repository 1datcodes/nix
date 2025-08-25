{ config, inputs, pkgs, ... }:
{
	programs.fish = {
		enable = true;
		shellAliases = {
			swatch = "sudo nixos-rebuild switch --flake /etc/nixos/#pro";
		};
		shellInit = "eval $(starship init fish)";
	};
	
	programs.starship.enableFishIntegration = true;
	home.file.".config/starship.toml".source = ../../dotfiles/starship.toml;

	home.sessionVariables = {
		EDITOR = "nvim";
		LANG = "en_US.UTF-8";
		WLR_DRM_DEVICES = "/dev/dri/card2";
	};
}
