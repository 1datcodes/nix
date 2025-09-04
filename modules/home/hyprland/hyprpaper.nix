{ config, inputs, pkgs, ... }: {
  # Hyprpaper
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "/home/michitanaka/Wallpaper/link-click-1.png" ];

      wallpaper = [ ", /home/michitanaka/Wallpaper/link-click-1.png" ];
    };
  };
}
