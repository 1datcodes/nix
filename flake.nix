{ description = "Zenful nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url="github:nix-community/home-manager";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, mac-app-util, nix-homebrew, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages =
        [ 
	  pkgs.git
	  pkgs.git-lfs
	  pkgs.git-credential-manager
	  pkgs.vscode
	  pkgs.discord
	  pkgs.raycast
	  pkgs.neovim
	  pkgs.fish
    pkgs.kitty
        ];

      environment.variables.EDITOR = "nvim";

	homebrew = { enable = true;
		brews = [
			"mas"
			"npm"
			"node"
		];
		casks = [
			"brave-browser"
			"1password@7"
			"spotify"
			"steam"
			"balenaetcher"
		];
		masApps = {
		};
		onActivation.cleanup = "zap";
		onActivation.autoUpdate = true;
		onActivation.upgrade = true;
	};

	system.defaults = {
		dock.autohide = true;
		dock.autohide-delay = 0.15;
		dock.minimize-to-application = true;
		dock.persistent-apps = [
			"${pkgs.vscode}/Applications/Visual Studio Code.app"
      "${pkgs.kitty}/Applications/kitty.app"
			"/Applications/Brave Browser.app"
			"/System/Applications/Messages.app"
			"${pkgs.discord}/Applications/discord.app"
			"/Applications/Spotify.app"
		];
		finder.FXPreferredViewStyle = "clmv";
		loginwindow.GuestEnabled = false;
		NSGlobalDomain.AppleICUForce24HourTime = true;
		NSGlobalDomain.AppleInterfaceStyle = "Dark";
		NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = false;
		NSGlobalDomain.KeyRepeat = 2;
		NSGlobalDomain.AppleTemperatureUnit = "Celsius";
		NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
		NSGlobalDomain.AppleMetricUnits = 1;
		finder._FXShowPosixPathInTitle = true;
		finder.CreateDesktop = false;
		finder.NewWindowTarget = "Home";
		finder.ShowStatusBar = true;
		menuExtraClock.ShowSeconds = true;
		menuExtraClock.Show24Hour = true;
		trackpad.Clicking = true;
		WindowManager.StandardHideDesktopIcons = true;
	};

	security.pam.services.sudo_local.touchIdAuth = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
	programs.fish = {
		enable = true;
		shellAliases = {

		};
	};
	environment.shells = [pkgs.fish];
	
	users.users.michitanaka = {
		shell = pkgs.fish;
		name = "michitanaka";
		home = "/Users/michitanaka";
	};

	# Fonts


      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
    homeconfig = {pkgs, config, ...}: {
    	# Internal compatibility configuration
	# for home-manager, don't change this
	home.stateVersion = "23.05";
	# Let home-manager install and manage itself
	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		pkgs.nerd-fonts.jetbrains-mono
		pkgs.nerd-fonts._0xproto
		pkgs.nerd-fonts.droid-sans-mono
	];

	fonts.fontconfig.enable = true;

	home.sessionVariables = {
		EDITOR = "vim";
	};

	home.file = {
		".vimrc".source = ./dotfiles/vim_config;
	};
	
	# adding alias to fish
	programs.fish = {
		enable = true;
		shellAliases = {
		};
	};

};

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ 
      	configuration
	mac-app-util.darwinModules.default
	nix-homebrew.darwinModules.nix-homebrew
	{
		nix-homebrew = {
			enable = true;
			enableRosetta = true;
			user = "michitanaka";
		};
	}
	home-manager.darwinModules.home-manager {
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.verbose = true;
		home-manager.users.michitanaka = homeconfig;
	}
	];
    };
  };
}
