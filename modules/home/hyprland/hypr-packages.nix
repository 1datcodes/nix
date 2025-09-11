{ config, inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    waybar
    wofi
    hyprpaper
    hyprpanel
    hypridle
    hyprlock
    hyprcursor
    hyprshot
    playerctl
    pavucontrol
    wlogout
  ];
}
