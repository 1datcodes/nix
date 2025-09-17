{ config, inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    vesktop
    brave
    _1password-gui
    qimgv
    vscode
    kitty
    zoom-us
  ];
}
