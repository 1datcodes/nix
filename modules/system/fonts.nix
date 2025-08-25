{ config, inputs, pkgs, ...}:
{
	fonts = {
		enableDefaultPackages = true;
		packages = with pkgs; [
			noto-fonts-cjk-sans
			noto-fonts-cjk-serif
			nerd-fonts.jetbrains-mono
			nerd-fonts.hack
			font-awesome
		];
	
		fontconfig = {
			defaultFonts = {
				serif = [ "nerd-fonts.jetbrains-mono" "noto-fonts-cjk-sans" ];
				sansSerif = [ "nerd-fonts.jetbrains-mono" "noto-fonts-cjk-serif" ];
				monospace = [ "nerd-fonts.jetbrains-mono" "nerd-fonts.hack" ];
			};
		};
	};
}
