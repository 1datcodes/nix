{ config, inputs, pkgs, ...}:
{
	environment.variables.EDITOR = "nvim";
	environment.sessionVariables.WLR_DRM_DEVICES = "/dev/dri/card2";
}
