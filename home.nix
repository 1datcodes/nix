{ ... }: {
    # This is required information for home-manager to do its job
    home = {
        stateVerision = "23.11";
        username = "michitanaka";
        homeDirectory = "/Users/michitanaka";
        packages = [ ];
    };
    programs.home-manager.enable = true;
    programs.fish.enable = true;
}
