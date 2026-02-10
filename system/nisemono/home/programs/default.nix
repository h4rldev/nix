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
    spicetify.enable = true;

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

    spicetify = {
      alwaysEnableDevTools = true;
      wayland = true;
      windowManagerPatch = true;
      enabledExtensions = [
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "Spikerko";
              repo = "spicy-lyrics";
              rev = "1b8858f94587d650255d60ff96d284f05af6440d";
              hash = "sha256-OXb6MOtkxiwBwFcuDxxcVqBod+JfAYpVz4WXw7JYbF4=";
            })
            + /builds;

          name = "spicy-lyrics.mjs";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "theRealPadster";
            repo = "spicetify-hide-podcasts";
            rev = "1541afc2d5585d764a11d67273217f3b5d78f879";
            hash = "sha256-DjvEScRWMk7+b7mKcIb0fASk3oH2epggIuQrfzzHuiI=";
          };
          name = "hidePodcasts.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "daksh2k";
              repo = "Spicetify-stuff";
              rev = "23a544f23ee45ad3161a3dba51e1cd0734d0f1de";
              hash = "sha256-mjw5glHnaDWbZbeLf93a2VOC9KgsvV9UAhDxC2R43MQ=";
            })
            + /Extensions/auto-skip/dist;
          name = "autoSkip.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "daksh2k";
              repo = "Spicetify-stuff";
              rev = "23a544f23ee45ad3161a3dba51e1cd0734d0f1de";
              hash = "sha256-mjw5glHnaDWbZbeLf93a2VOC9KgsvV9UAhDxC2R43MQ=";
            })
            + /Extensions;
          name = "volumePercentage.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "ohitstom";
              repo = "spicetify-extensions";
              rev = "0dc291fc26410499f1ee273a2cd3744148e62b7c";
              hash = "sha256-GVlfji0n9LX1xi7l4gG6Tboo4o554auYplM8CW08tFQ=";
            })
            + /scannables;
          name = "scannables.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "Pithaya";
              repo = "spicetify-apps";
              rev = "1645dc91fbfed89ef9a35fdfc7316259df1653c5";
              hash = "sha256-6xeXFoS/DIu7A+zIyzB3gVw6KgirnNIgqCkSt9p8pUo=";
            })
            + /extensions/romaji-convert/dist;

          name = "romaji-convert.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "iHelops";
              repo = "smooth-scrolling";
              rev = "10b1aebdbfbb9c7cc04c8b33e074f653437a0dd0";
              hash = "sha256-KlEmL6pESgODTqkT0a4Zbj2Qga6t8fQOsyBsGvY+504=";
            })
            + /dist;
          name = "smooth-scrolling.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "ssatwik975";
              repo = "Speedify";
              rev = "69a90c6a9833ba8a7da1a90c61734f77f370950d";
              hash = "sha256-Kf+mR41NfX+yOEQCnDFUjHRPcJZHvPFXBUFg6BBuYXA=";
            })
            + /dist;

          name = "speedify.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "41pha1";
              repo = "spicetify-extensions";
              rev = "5015b9122a9c39274bdc7507e1de4fec0cc20f95";
              hash = "sha256-JkkIs40Kp57kLTcb95WIgfHDoCP/LHZ3TmdP1w1e1OY=";
            })
            + /romaja-lyrics;
          name = "romaja_lyrics.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "41pha1";
              repo = "spicetify-extensions";
              rev = "5015b9122a9c39274bdc7507e1de4fec0cc20f95";
              hash = "sha256-JkkIs40Kp57kLTcb95WIgfHDoCP/LHZ3TmdP1w1e1OY=";
            })
            + /romaji-lyrics;
          name = "romaji_lyrics.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "Aimarekin";
              repo = "Aimarekins-Spicetify-Extensions";
              rev = "82dbbaec37540e82dcd11d897646c0fdb068c3e8";
              hash = "sha256-ssUhZDAnPVsIFnKpm83sDe4+aShOjgWnmtPxOlifHAQ=";
            })
            + /_dist;
          name = "playing-source.js";
        }
        {
          src =
            (pkgs.fetchFromGitHub {
              owner = "pnthach95";
              repo = "spicetify-extensions";
              rev = "9131a056372e9cba3b44858549c95710073347eb";
              hash = "sha256-i5DliX8EUH6rZGXjqGD+YrwklJ5IXb+sIHieiT5Cm6o=";
            })
            + /dist;
          name = "copytoclipboard.js";
        }
      ];
    };
  };

  imports = [
    ./waybar.nix
    ./terminal.nix
    # ./carapace.nix
    # ./nushell.nix
  ];
}
