{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      "$accent" = "rgb(94e2d5)";
      "$accentAlpha" = "94e2d5";
      "$font" = "JetBrainsMono Nerd Font";

      # GENERAL
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      # BACKGROUND
      background = {
        monitor = "eDP-1";
        path = "/home/h4rl/.config/nix/.wallpapers/lain.png";
        blur_passes = 0;
        color = "rgb(1e1e2e)";
      };

      # TIME
      label = [
        {
          monitor = "eDP-1";
          text = "cmd[update:30000] echo \"$(date +\"%R\")\"";
          color = "rgb(cdd6f4)";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "eDP-1";
          text = "cmd[update:43200000] echo \"$(date +\"%A, %d %B %Y\")\"";
          color = "rgb(cdd6f4)";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # USER AVATAR
      image = {
        monitor = "eDP-1";
        path = "/home/h4rl/.config/nix/.face/h4rl.png";
        size = 100;
        border_color = "$accent";
        position = "0, 75";
        halign = "center";
        valign = "center";
      };

      # INPUT FIELD
      input-field = {
        monitor = "eDP-1";
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$accent";
        inner_color = "rgb(313244)";
        font_color = "rgb(cdd6f4)";
        fade_on_empty = false;
        placeholder_text = "<span foreground=\"##cdd6f4\"><i>󰌾 Logged in as </i><span foreground=\"##$accentAlpha\">$USER</span></span>";
        hide_input = false;
        check_color = "$accent";
        fail_color = "rgb(f38ba8)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "rgb(f9e2af)";
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
