{ inputs, ... }: {
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar.customModules.storage.paths = [ "/" ];
      theme.font = {
        name = "JetBrainsMono Nerd Font";
        style = "normal";
        label = "JetBrainsMono Nerd Font";
      };
      theme.bar.menus.enableShadow = false;
      scalingPriority = "hyprland";
      bar.layouts = {
        "*" = {
          left = [ "dashboard" "workspaces" "windowtitle" ];
          middle = [ "media" ];
          right = [ "volume" "network" "bluetooth" "clock" "notifications" ];
        };
      };
      bar.launcher.icon = "";
      bar.launcher.autoDetectIcon = true;
      menus.clock.time.military = true;
      menus.clock.weather = {
        location = "94596";
        key = "f5380d7fd733406bacb65503251709";
        unit = "metric";
      };

    };
  };

}
