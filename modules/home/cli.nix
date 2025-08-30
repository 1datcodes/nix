{ config, inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    git
    git-credential-manager
    git-lfs
    fastfetch
    htop
    btop
    starship
    ollama
    radeontop
    pciutils
    usbutils
    tree
    wl-clipboard
    caligula
  ];

  programs.git = {
    enable = true;
    userName = "1datcodes";
    userEmail = "tanakamichi7@gmail.com";

    lfs.enable = true;

    extraConfig = {
      credential.helper = "manager";
      credential."https://github.com".username = "1datcodes";
      credential.credentialStore = "cache";
    };
  };
}
