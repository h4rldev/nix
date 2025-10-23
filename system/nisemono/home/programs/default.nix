{
  pkgs,
  inputs,
  lib,
  ...
}: {
  /*
  [pyprland]
  plugins = ["magnify", "scratchpads", "workspaces_follow_focus"]

  [scratchpads.term]
  animation = "fromTop"
  command = "ghostty --class=drop.term"
  class = "drop.term"
  size = "75% 60%"
  max_size = "2560px 100%"
  margin = 50

  [scratchpads.volume]
  animation = "fromRight"
  command = "pwvucontrol"
  class = "com.saivert.pwvucontrol"
  size = "40% 90%"
  unfocus = "hide"
  lazy = true

  [workspaces_follow_focus]
  max_workspaces = 4
  */

  home.file.".config/hypr/pyprland.toml" = {
    source = (pkgs.formats.toml {}).generate "pyprland-config" {
      pyprland = {
        plugins = ["magnify" "scratchpads" "workspaces_follow_focus"];
      };
      scratchpads = {
        term = {
          animation = "fromTop";
          command = "ghostty --class=drop.term";
          class = "drop.term";
          size = "75% 60%";
          max_size = "2560px 100%";
          margin = 50;
        };
        volume = {
          animation = "fromRight";
          command = "pwvucontrol";
          class = "com.saivert.pwvucontrol";
          size = "40% 90%";
          unfocus = "hide";
          lazy = true;
        };
      };
      workspaces_follow_focus = {
        max_workspaces = 4;
      };
    };
  };

  /*
  [general]
  # Start Satty in fullscreen mode
  fullscreen = false
  # Exit directly after copy/save action
  early-exit = true
  # Draw corners of rectangles round if the value is greater than 0 (0 disables rounded corners)
  corner-roundness = 12
  # Select the tool on startup [possible values: pointer, crop, line, arrow, rectangle, text, marker, blur, brush]
  initial-tool = "brush"
  # Configure the command to be called on copy, for example `wl-copy`
  copy-command = "wl-copy"
  # Increase or decrease the size of the annotations
  annotation-size-factor = 2
  # Filename to use for saving action. Omit to disable saving to file. Might contain format specifiers: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
  output-filename = "/tmp/test-%Y-%m-%d_%H:%M:%S.png"
  # After copying the screenshot, save it to a file as well
  save-after-copy = false
  # Hide toolbars by default
  default-hide-toolbars = false
  # The primary highlighter to use, the other is accessible by holding CTRL at the start of a highlight [possible values: block, freehand]
  primary-highlighter = "block"
  # Disable notifications
  disable-notifications = false
  # Deprecated: use actions-on-enter instead
  action-on-enter = "save-to-clipboard"
  # Right click to copy
  # Deprecated: use actions-on-right-click instead
  right-click-copy = false

  # Font to use for text annotations
  [font]
  family = "Roboto"
  style = "Bold"

  # Custom colours for the colour palette
  [color-palette]
  # These will be shown in the toolbar for quick selection
  palette = [
      "#00ffff",
      "#a52a2a",
      "#dc143c",
      "#ff1493",
      "#ffd700",
      "#008000",
  ]

  # These will be available in the color picker as presets
  # Leave empty to use GTK's default
  custom = [
      "#00ffff",
      "#a52a2a",
      "#dc143c",
      "#ff1493",
      "#ffd700",
      "#008000",
  ]
  */

  home.file.".config/satty/config.toml" = {
    source = (pkgs.formats.toml {}).generate "satty-config" {
      general = {
        # Start Satty in fullscreen mode
        fullscreen = false;

        # Exit directly after copy/save action
        early-exit = true;

        # Draw corners of rectangles round if the value is greater than 0 (0 disables rounded corners)
        corner-roundness = 12;

        # Select the tool on startup [possible values: pointer, crop, line, arrow, rectangle, text, marker, blur, brush]
        initial-tool = "brush";

        # Configure the command to be called on copy, for example `wl-copy`
        copy-command = "wl-copy";

        # Increase or decrease the size of the annotations
        annotation-size-factor = 1;

        # Filename to use for saving action. Omit to disable saving to file. Might contain format specifiers: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
        output-filename = "/tmp/screenshot-%Y-%m-%d_%H:%M:%S.png";

        # After copying the screenshot, save it to a file as well
        save-after-copy = false;

        # Hide toolbars by default
        default-hide-toolbars = false;

        # The primary highlighter to use, the other is accessible by holding CTRL at the start of a highlight [possible values: block, freehand]
        primary-highlighter = "block";

        # Disable notifications
        disable-notifications = false;

        action-on-enter = "save-to-clipboard";

        right-click-copy = false;
      };

      # Font to use for text annotations
      font = {
        family = "Roboto";
        style = "Bold";
      };

      # Custom colours for the colour palette
      color-palette = {
        # These will be shown in the toolbar for quick selection
        palette = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];

        # These will be available in the color picker as presets
        # Leave empty to use GTK's default
        custom = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];
      };
    };
  };

  home.file.".config/sys64/power/style.css" = {
    text = ''
      #syspower {
        background: rgba(0, 0, 0, 0);
      }

      #syspower .box_buttons {
        background: rgba(30, 30, 46, 0.9);
        padding: 10px;
        border: 2px solid rgba(255, 255, 255, 0.9);
      }

      #syspower .button_shutdown {
        background: rgba(88, 91, 112, 0.9);
      }

      #syspower .button_shutdown:hover {
        background: rgba(69, 71, 90, 1);
      }

      #syspower .button_reboot {
        background: rgba(88, 91, 112, 0.9);
      }

      #syspower .button_reboot:hover {
        background: rgba(69, 71, 90, 1);
      }

      #syspower .button_logout {
        background: rgba(88, 91, 112, 0.9);
      }

      #syspower .button_logout:hover {
        background: rgba(69, 71, 90, 1);
      }

      #syspower .button_suspend {
        background: rgba(88, 91, 112, 0.9);
      }

      #syspower .button_suspend:hover {
        background: rgba(69, 71, 90, 1);
      }

      #syspower .button_cancel {
        background: rgba(88, 91, 112, 0.9);
      }

      #syspower .button_cancel:hover {
        background: rgba(69, 71, 90, 1);
      }
    '';
  };

  programs = {
    mpv.enable = true;
    imv.enable = true;
    hyprlock.enable = true;
    element-desktop.enable = true;
    chromium.enable = true;
    fuzzel.enable = true;

    element-desktop = {
      package = pkgs.element-desktop.overrideAttrs (old: {
        desktopItem = pkgs.makeDesktopItem {
          name = "element-desktop";
          exec = "element-desktop %u --password-store=gnome-libsecret";
          icon = "element";
          desktopName = "Element";
          genericName = "Matrix Client";
          comment = old.meta.description;
          categories = [
            "Network"
            "InstantMessaging"
            "Chat"
          ];
          startupWMClass = "Element";
          mimeTypes = [
            "x-scheme-handler/element"
            "x-scheme-handler/io.element.desktop"
          ];
        };
      });
    };

    chromium = {
      package = pkgs.brave;

      extensions = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
        "kpmjjdhbcfebfjgdnpjagcndoelnidfj" # Control Panel for Twitter
        "cofdbpoegempjloogbagkncekinflcnj" # DeepL Translator
        "agnaejlkbiiggajjmnpmeheigkflbnoo" # Discord Rich Presence
        "ponfpcnoihfmfllpaingbgckeeldkhle" # Enhancer for YouTube
        "edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
        "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
        "kekjfbackdeiabghhcdklcdoekaanoel" # MAL-Sync
        "nbcjlcokgigjfhejofmbaomcimggiafn" # movie-web remastered extension
        "nbdpnlpphdfoodlknhfphenniclnjcgl" # nothx
        "agjnjboanicjcpenljmaaigopkgdnihi" # PreMiD
        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
        "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
        "ijcpiojgefnkmcadacmacogglhjdjphj" # Shinigami Eyes
        "mafpmfcccpbjnhfhjnllmmalhifmlcie" # Snowflake
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube - Skip Sponsorships
        "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "cbghhgpcnddeihccjmnadmkaejncjndb" # Vencord Web
      ];
      commandLineArgs = [
        "--hide-crash-restore-bubble"
        "--disable-features=WaylandWpColorManagerV1"
      ];
    };
    fuzzel = {
      settings = {
        main = {
          terminal = "${inputs.ghostty.packages.x86_64-linux.default}/bin/ghostty";
          layer = "overlay";
          font = lib.mkForce "JetBrainsMono Nerd Font:size=16";
          dpi-aware = "yes";
          width = 100;
        };
      };
    };
  };

  imports = [
    ./direnv.nix
    ./git.nix
    ./qt.nix
    ./zsh.nix
    ./mime.nix
    ./fuzzel.nix
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./gtk.nix
    ./hyprpaper.nix
    ./wlogout.nix
    ./fastfetch.nix
    ./stylix.nix
    ./mako.nix
    ./zoxide.nix
    ./catppuccin.nix
    ./ghostty.nix
    ./ibus.nix
    ./sshfs.nix
    ./hypridle.nix
    ./xdg-portal.nix
    ./zed.nix
    ./brave.nix
    ./carapace.nix
    # ./nushell.nix
  ];
}
