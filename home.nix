{ pkgs, ... }: {
    # This is required information for home-manager to do its job
    home = {
        stateVersion = "23.11";
        username = "michitanaka";
        homeDirectory = "/Users/michitanaka";
        packages = [
            pkgs.git
            pkgs.neovim
        ];
    };

    # Ensure programs are using ~/.config rather than /Users/michitanaka/Library/...
    xdg.enable = true;

    programs.home-manager.enable = true;
    programs.fish.enable = true;
}
