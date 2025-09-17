{ config, inputs, pkgs, ... }: {
  environment.variables.EDITOR = "nvim";
  environment.sessionVariables.WLR_DRM_DEVICES = "/dev/dri/card2";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  nix.settings.download-buffer-size = 500 * 1024 * 1024;
}
