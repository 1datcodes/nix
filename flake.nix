{
  description = "Simple NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix/release-25.05";
    hyprland.url = "github:hyprwm/Hyprland";
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, hyprland, quickshell
    , spicetify-nix, ... }@inputs: {
      nixosConfigurations = {
        pro = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/pro/configuration.nix
            catppuccin.nixosModules.catppuccin

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.michitanaka = {
                imports = [
                  ./home/michitanaka/home.nix
                  catppuccin.homeModules.catppuccin
                  spicetify-nix.homeManagerModules.spicetify
                ];
              };
            }
          ];
        };
      };
    };
}

