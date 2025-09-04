{ config, inputs, pkgs, ... }: {
  # Define a user account
  users.users.michitanaka = {
    isNormalUser = true;
    description = "Michi Tanaka";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
  };

  # Default shell
  users.defaultUserShell = pkgs.fish;
}
