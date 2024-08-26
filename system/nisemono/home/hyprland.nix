{
  hyprland,
  pkgs,
  config,
  libs,
  ...
}: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "eval \"$(ssh-agent -s)\""
      "eddie-ui"
      "hyprctl dispatch movecursor 1280 720"
    ];

    "$monitor1" = "DP-2";
    "$monitor2" = "HDMI-A-1";
    monitor = [
      "$monitor1, 2560x1440@165, 0x0, 1"
      "$monitor2, 1680x1050@60, -1680x330, 1"
    ];

    "$terminal" = "kitty";
    "$fileManager" = "pcmanfm";
    "$menu" = "tofi-drun --drun-launch=true";
    "$regionScreenshot" = "grimblast --notify --cursor --freeze copy area";
    "$windowScreenshot" = "grimblast --notify --cursor --freeze copy active";
    "$fullScreenshot" = "grimblast --notify --cursor --freeze copy output";
    "$cmdmenu" = "tofi-run | xargs hyprctl dispatch exec kitty";
    "$logout" = "wlogout -b 4";
    "$volume" = "/etc/nixos/.bin/volume";

    env = [
      "XCURSOR_SIZE, 24"
    ];

    debug = {
      disable_logs = false;
    };

    input = {
      kb_layout = "se";
      follow_mouse = 1;
      # touchpad = {
      #  scroll_factor = 0.2;
      # };
      sensitivity = -0.5;
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

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgb(11111b)";
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
      force_default_wallpaper = 1;
      vfr = true;
    };

    "$mod" = "SUPER";
    bind =
      [
        "$mod, T, exec, kitty"
        "$mod, W, killactive,"
        "CTRL, Print, exec, $regionScreenshot"
        "SHIFT, Print, exec, $windowScreenshot"
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

        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"

        "$mod CTRL, 1, movecurrentworkspacetomonitor, $monitor1"
        "$mod CTRL, 2, movecurrentworkspacetomonitor, $monitor2"

        "$mod, mouse_up, workspace, e-1"
        "$mod, mouse_down, workspace, e+1"
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
}
