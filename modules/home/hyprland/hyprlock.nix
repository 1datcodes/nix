{ config, inputs, pkgs, ... }: {
  # Hyprlock
  programs.hyprlock = {
    enable = true;
    settings = {
      source = "/home/michitanaka/.config/hypr/mocha.conf";

      "$accent" = "$mauve";
      "$accentAlpha" = "$mauveAlpha";
      "$font" = "JetBrainsMono Nerd Font";

      general = {
        "hide_cursor" = true;
        "ignore_empty_input" = true;
      };

      background = [{
        path = "~/Wallpaper/link-click-1.png";
        "blur_passes" = 1;
        color = "$base";
      }];

      image = [{
        path = "~/Pictures/moon-cat.jpg";
        size = 220;
        position = "0, -125";
        "border_size" = 6;
        "border_color" = "$accent";
        halign = "center";
        valign = "center";
      }];

      label = [
        {
          #monitor = "desc:LG Electronics LG UltraFine 704NTWGFD161";
          text = "$TIME";
          color = "$text";
          "font_size" = 115;
          "font_family" = "$font";
          position = "0, 400";
          halign = "center";
          valign = "center";
        }
        {
          #monitor = "desc:LG Electronics LG UltraFine 704NTWGFD161";
          text =
            "cmd[update:43200000] date +'%A, %B %-d'"; # Full weekday name, full month name, day of month
          color = "$text";
          "font_size" = 25;
          "font_family" = "$font";
          position = "0, 310";
          halign = "center";
          valign = "center";
        }
        {
          text =
            "<span foreground='##$textAlpha'>Welcome back, <span foreground='##$accentAlpha'>Master</span></span>";
          "font_size" = 16;
          position = "0, -280";
          halign = "center";
          valign = "center";
        }
        #{
        #  text = "󰤄";
        #  color = "$accent";
        #  "font_size" = 24;
        #  position = "-100, -108";
        #  halign = "center";
        #  valign = "center";
        #}
        #{
        #  text = "";
        #  color = "$accent";
        #  "font_size" = 24;
        #  position = "0, -108";
        #  halign = "center";
        #  valign = "center";
        #  onclick = "";
        #}
        #{
        #  text = "⏻";
        #  color = "$accent";
        #  "font_size" = 24;
        #  position = "100, -108";
        #  halign = "center";
        #  valign = "center";
        #}
      ];

      input-field = {
        #monitor = "desc:LG Electronics LG UltraFine 704NTWGFD161";
        size = "400, 60";
        "outline_thickness" = 4;
        "dots_size" = 0.2;
        "dots_spacing" = 0.2;
        "dots_center" = true;
        "outer_color" = "$accent";
        "inner_color" = "$surface0";
        "font_color" = "$text";
        "fade_on_empty" = false;
        "placeholder_text" =
          "<span foreground='##$textAlpha'><i>󰌾 Logged in as </i><span foreground='##$accentAlpha'>$USER</span></span>";
        "hide_input" = false;
        "check_color" = "$accent";
        "fail_color" = "$red";
        "fail_text" = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        "capslock_color" = "$yellow";
        position = "0, -347";
        halign = "center";
        valign = "center";
      };
    };

  };
}
