{
  hyprland,
  pkgs,
  config,
  libs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      exec-once = [
        "hyprctl dispatch movecursor 1280 720 &"
        "pypr &"
        "mullvad-vpn &"
        # "swww-daemon &"
        # "swww img --resize=crop ${config.home.homeDirectory}/.config/nix/.wallpapers/pixelhoo_ramen_shop.gif &"
        "hyprctl setcursor catppuccin-mocha-light-cursors 18"
        "fcitx5-remote -r"
        "fcitx5 -d --replace &"
        "fcitx5-remote -r"
      ];

      "$monitor1" = "DP-1";
      "$monitor2" = "HDMI-A-1";
      monitor = [
        "$monitor1, 2560x1440@165, 0x0, 1"
        "$monitor2, 1680x1050@60, -1680x330, 1"
      ];

      "$terminal" = "ghostty";
      "$fileManager" = "pcmanfm";
      # "$fileManager" = "nautilus";
      "$menu" = "fuzzel";
      "$regionScreenshot" = "grimblast --notify --freeze save area - | satty --copy-command wl-copy --filename -";
      "$windowScreenshot" = "grimblast --notify --freeze save active - | satty --copy-command wl-copy --filename -";
      "$outputScreenshot" = "grimblast --notify --freeze save output - | satty --copy-command wl-copy --fullscreen --filename -";
      "$fullScreenshot" = "grimblast --notify --freeze save screen - | satty --copy-command wl-copy --fullscreen --filename -";
      "$logout" = "wlogout -b 4";
      "$volume" = "/home/h4rl/.config/nix/.bin/volume";

      env = [
        "HYPRCURSOR_SIZE, 18"
        "XCURSOR_SIZE, 18"
        "GTK_IM_MODULE, fcitx"
        "QT_IM_MODULE, fcitx"
        "XMODIFIERS, @im=fcitx"
      ];

      debug = {
        disable_logs = false;
      };

      input = {
        kb_layout = "se";
        kb_options = "ctrl:nocaps, compose:rctrl";
        follow_mouse = 1;
        # touchpad = {
        #  scroll_factor = 0.2;
        # };
        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 3;
        "col.active_border" = "rgb(94e2d5) rgb(f2cdcd) 25deg";
        "col.inactive_border" = "rgb(11111b)";

        layout = "dwindle";

        allow_tearing = false;
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 4;
          passes = 1;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgb(11111b)";
        };
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "off";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        vfr = true;
        middle_click_paste = false;
      };

      workspace = [
        "special:exposed,gapsout:60,gapsin:30,bordersize:5,border:true,shadow:false"
      ];

      windowrule = [
        "float, class:^(drop.term)$"
        "float, class:^(com.saivert.pwvucontrol)$"
      ];

      "$mod" = "SUPER";
      bind =
        [
          "$mod, T, exec, $terminal"
          "$mod, W, killactive,"
          "CTRL, Print, exec, $regionScreenshot"
          "SHIFT, Print, exec, $windowScreenshot"
          "CTRL SHIFT, Print, exec, $outputScreenshot"
          ", Print, exec, $fullScreenshot"
          "$mod, E, exec, $fileManager"
          "$mod, L, exec, $logout"
          "$mod, F, togglefloating,"
          "$mod SHIFT, F, fullscreenstate, 2 2"
          "$mod CTRL, F, fullscreenstate, -1 2"
          "$mod, D, exec, $menu"
          "$mod, R, exec, $cmdmenu"
          "$mod, P, pseudo,"
          "$mod, S, togglesplit,"

          "SUPER_CTRL,space,execr,fcitx5-remote -t"
          "$mod, left, movefocus, l"
          "$mod, down, movefocus, d"
          "$mod, up, movefocus, u"
          "$mod, right, movefocus, r"

          "$mod CTRL, 1, movecurrentworkspacetomonitor, $monitor1"
          "$mod CTRL, 2, movecurrentworkspacetomonitor, $monitor2"

          "$mod, K, exec, pypr change_workspace +1"
          "$mod, J, exec, pypr change_workspace -1"

          "$mod, mouse_up, exec, pypr zoom -1"
          "$mod, mouse_down, exec, pypr zoom +1"
          "$mod, z, exec, pypr zoom"

          "$mod, V, exec, pypr toggle volume"
          "$mod, A, exec, pypr toggle term"
          "$mod, Y, exec, pypr attach"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      bindle = [
        ", XF86AudioRaiseVolume, exec, $volume up"
        ", XF86AudioLowerVolume, exec, $volume down"
        ", XF86AudioMute, exec, $volume mute"
      ];

      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
