{
  config,
  pkgs,
  inputs,
  ...
}: {
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "teal";
  };

  qt.enable = true;

  environment.systemPackages = with pkgs; [
    (bottles.override
      {
        removeWarningPopup = true;
      })
    reaction
    gearlever
    r2modman
    nss_latest
    nspr
    freetype
    libxft
    ftgl
    quesoglc
  ];

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprland = {
      enable = true;
    };

    regreet = {
      enable = true;
      package = pkgs.regreet;
      theme = {
        name = "catppuccin-mocha-teal-standard+default";
        package = pkgs.catppuccin-gtk;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      cursorTheme = {
        name = "catppuccin-mocha-light-cursors";
        package = pkgs.catppuccin-cursors;
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 16;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      settings = {
        background = {
          path = "${config.users.users.h4rl.home}/.config/nix/.wallpapers/bliss.jpg";
          fit = "Cover";
        };

        GTK = {
          application_prefer_dark_theme = true;
        };

        appearance = {
          greeting_msg = "Welcome back!";
        };

        commands = {
          reboot = ["systemctl" "reboot"];
          poweroff = ["systemctl" "poweroff"];
        };
      };
    };

    virt-manager = {
      enable = true;
    };

    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extest.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    sniffnet.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    nix-ld = {
      enable = true;
    };

    gpu-screen-recorder = {
      enable = true;
      package = pkgs.gpu-screen-recorder;
    };

    obs-studio = {
      enable = true;
      enableVirtualCamera = false;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-markdown
        obs-gstreamer
        obs-dvd-screensaver
        obs-freeze-filter
        obs-aitum-multistream
        input-overlay
      ];
    };

    neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      defaultEditor = true;
    };

    nh = {
      enable = true;
      clean.enable = true;
      flake = "${config.users.users.h4rl.home}/.config/nix";
    };

    gamemode = {
      enable = true;
      enableRenice = true;

      settings = {
        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'Gamemode' 'Starting gamemode'";
          stop = "${pkgs.libnotify}/bin/notify-send 'Gamemode' 'Stopping gamemode'";
        };
      };
    };

    ssh = {
      extraConfig = ''
        Host home-server
          HostName 192.168.50.47
          Port 22345
          User h4rl
          IdentityFile ${config.users.users.h4rl.home}/.ssh/h4rl-nisemono
      '';
    };
  };
}
