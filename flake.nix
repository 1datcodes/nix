{
    description = "Michi's dotfiles";

    # inputs are other flakes you use within your own flake, dependencies if you will
    inputs = {
           # Unstable has the 'freshest' packages
           nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
           home-manager = {
               url = "github:nix-community/home-manager";
               inputs.nixpkgs.follows = "nixpkgs";
           };
    };

    # In this context, outputs are mostly about getting home-manager what it needs
    outputs = { nixpkgs, home-manager, ... }: {
        homeConfigurations = {
            "michitanaka" = home-manager.lib.homeManagerConfiguration {
                # darwin is macOS kernel and aarch means ARM
                pkgs = nixpkgs.legacyPackages.aarch64-darwin;
                modules = [ ./home.nix ];
            };
        };
    };
}
