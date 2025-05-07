{ description = "Zenful nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, mac-app-util, nix-homebrew, nixpkgs }:
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
        ];

	homebrew = { enable = true;
		brews = [
			"mas"
		];
		casks = [
			"brave-browser"
			"1password@7"
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
			"/Applications/Brave Browser.app"
			"/System/Applications/Utilities/Terminal.app"
			"/System/Applications/Messages.app"
		];
		finder.FXPreferredViewStyle = "clmv";
		loginwindow.GuestEnabled = false;
		NSGlobalDomain.AppleICUForce24HourTime = true;
		NSGlobalDomain.AppleInterfaceStyle = "Dark";
		NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = false;
		NSGlobalDomain.KeyRepeat = 2;
		NSGlobalDomain.AppleTemperatureUnit = "Celsius";
		NSGlobalDomain.AppleMeasurementUnits = "Centimeters"
		NSGlobalDomain.AppleMetricUnits = 1;
		finder._FXShowPosixPathInTitle = true;
		finder.CreateDesktop = false;
		finder.NewWindowTarget = "Home";
		finder.ShowStatusBar = true;
		menuExtraClock.ShowSeconds = true;
		menuExtraClock.Show24Hour = true;
		trackpad.Clicking = true;
		trackpad.TrackpadThreeFingerDrag = true;
		WindowManager.StandardHideDesktopIcons = true;
	};

	security.pam.services.sudo_local.touchIdAuth = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
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
	];
    };
  };
}
