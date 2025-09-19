{ config, inputs, pkgs, ... }: {
  # Hyprland configs
  wayland.windowManager.hyprland = {
    enable = true;
    # Using system package
    package = null;
    portalPackage = null;

    # Plugins
    plugins = [ ];

    # Extra configs
    extraConfig = "debug:disable_logs = false ";

    # Declaratively define settings
    settings = {
      # Catppuccin
      source = "/home/michitanaka/.config/hypr/mocha.conf";

      # Variables
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi || pkill wofi";
      "$browser" = "brave";

      # Auto Start
      exec-once = [
        # Apps
        "$browser"
        "spotify"
        "legcord"

        # Daemons
        "playerctld"
        "hyprlock"
        "hypridle"
        "blueman-applet"
        "ollama serve"
      ];

      # Monitors
      monitor = [
        "desc:LG Electronics LG UltraFine 704NTWGFD161, preferred, 0x0, 1.6"
        "desc:LG Electronics LG ULTRAGEAR 107NTKFCQ421, 2560x1440, auto-right, 1"
      ];

      xwayland = { "force_zero_scaling" = true; };

      # Keybinds
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, F, togglefloating"
        "$mod, ESCAPE, exec, hyprlock"
        "$mod, SPACE, exec, $menu"

        # Move focus
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        # Move Window
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        # Switch workspace
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 0"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 0"

        # Scratch pad
        "$mod, S, togglespecialworkspace, scratchpad"
        "$mod SHIFT, S, movetoworkspace, special:scratchpad"

        # Minimize effect
        "ALT, H, togglespecialworkspace, hidden"
        "ALT, H, movetoworkspace, +0"
        "ALT, H, togglespecialworkspace, hidden"
        "ALT, H, movetoworkspace, special:hidden"
        "ALT, H, togglespecialworkspace, hidden"

        # Toggle between special workspaces
        "ALT, S, exec, ~/nixos-config/scripts/cycle_special_ws.sh"

        # Screenshot
        "$mod, P, exec, hyprshot -m region -o /home/michitanaka/Pictures/Screenshots -- qimgv"
        "$mod SHIFT, P, exec, hyprshot -m output -o /home/michitanaka/Pictures/Screenshots -- qimgv"

      ];

      # Hold keys to execute
      bindo = [
        # Super+Ctrl+Escape exits Hyprland
        "$mod CTRL, ESCAPE, exit"
      ];

      # Mouse button binds
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      # Will also work when locked
      bindl = [
        ", F9, exec, playerctl next"
        ", F8, exec, playerctl play-pause"
        ", F7, exec, playerctl previuos"
      ];

      # Key repeat + locked
      bindel = [
        ", F12, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", F1, exec, sudo ddcutil setvcp 10 -5"
        ", F2, exec, sudo ddcutil setvcp 10 +5"
      ];

      # Look and Feel
      general = {
        "gaps_in" = 5;
        "gaps_out" = 20;
        "border_size" = 2;

        "col.active_border" = "$lavender";
        "col.inactive_border" = "$surface2";

        "resize_on_border" = false;
        "allow_tearing" = false;
        "layout" = "dwindle";
      };

      decoration = {
        "rounding" = 10;
        "rounding_power" = 2;

        "active_opacity" = 0.9;
        "inactive_opacity" = 0.9;

        "shadow" = {
          "enabled" = true;
          "range" = 4;
          "render_power" = 3;
          "color" = "rgba(1a1a1aee)";
        };

        "blur" = {
          "enabled" = true;
          "size" = 3;
          "passes" = 1;
          "vibrancy" = 0.1696;
        };
      };

      input = { "natural_scroll" = true; };

      animations = {
        "enabled" = true;

        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      windowrule = [
        "center 1, floating:1, xwayland:0"
        "float, class:blueman-manager"
        # Special workspaces
        "workspace special:sysmon, class:btop"
        "workspace special:music, class:spotify"
        "workspace special:music, initialTitle:Spotify Premium"
        "workspace special:comms, class:vesktop|discord"
        "workspace special:garbage, class:xwaylandvideobridge"
      ];

      workspace = [
        "1, monitor:desc:LG Electronics LG UltraFine 704NTWGFD161, default:true"
        "2, monitor:desc:LG Electronics LG ULTRAGEAR 107NTKFCQ421, default:true"
      ];
    };
  };
}

