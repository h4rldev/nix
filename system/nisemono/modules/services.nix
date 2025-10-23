{
  pkgs,
  config,
  ...
}: let
  hyprlandConfig = pkgs.writeText "greetd-hyprland-config" ''
    monitor=DP-1, 2560x1440@165, auto, 1

    env = XCURSOR_SIZE,18
    env = HYPRCURSOR_SIZE,18

    animations {
      enabled = no
    }

    misc {
      force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
      disable_hyprland_logo = true
      disable_splash_rendering = true
      disable_hyprland_qtutils_check = true
    }

    exec-once = hyprctl dispatch movecursor 1280 720
    exec-once = hyprctl setcursor catppuccin-mocha-light-cursors 20
    exec-once = ${config.programs.regreet.package}/bin/regreet; hyprctl dispatch exit
  '';
in {
  security.polkit.enable = true;
  security.rtkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  services = {
    udisks2.enable = true;
    gvfs.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "Hyprland --config ${hyprlandConfig}";
          user = "h4rl";
        };

        initial_session = {
          command = "Hyprland";
          user = "h4rl";
        };
      };
      restart = false;
    };
    xserver = {
      xkb.layout = "se";
      videoDrivers = ["amdgpu"];
    };
    # libinput.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      wireplumber = {
        enable = true;
        configPackages = [
          (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-clock-settings.lua" ''
            context.properties = {
              default.clock.rate = nil,
              default.clock.quantum = nil,
              default.clock.min-quantum = nil,
              default.clock.max-quantum = nil,
              default.clock.force-rate = nil,
              default.clock.force-quantum = nil,
              default.clock.allowed-rates = nil
            }
          '')
        ];
      };
    };

    ollama = {
      enable = false;
      package = pkgs.ollama-rocm;
      acceleration = "rocm";
      rocmOverrideGfx = "10.1.0";
      models = "/mnt/byebyewindows/ollama/models";
      loadModels = [
        "qwen2.5-coder:14b"
      ];
    };

    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };

    gnome = {
      gnome-keyring.enable = true;
    };
    flatpak.enable = true;

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    ratbagd.enable = true;
  };
}
