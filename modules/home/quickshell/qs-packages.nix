{ pkgs, ... }: {
  home.packages = with pkgs; [
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtimageformats
    libsForQt5.qt5.qtmultimedia
    kdePackages.qt5compat
  ];
}
