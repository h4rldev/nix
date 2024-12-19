{
  pkgs,
  config,
  libs,
  ...
}: let
  hyprlandConfig = pkgs.writeText "greetd-hyprland-config" ''
    monitor=DP-1, 2560x1440@165, auto, 1

    exec-once=hyprctl dispatch movecursor 1280 720

    env = XCURSOR_SIZE,18
    env = HYPRCURSOR_SIZE,18

    animations {
      enabled = no
    }

    misc {
      force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
    }

    $setMouse = hyprctl setcursor catppuccin-mocha-light-cursors 18
    exec-once = $setMouse & ${config.programs.regreet.package}/bin/regreet; hyprctl dispatch exit
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
      settings = rec {
        initial_session = {
          command = "Hyprland --config ${hyprlandConfig}";
          user = "h4rl";
        };
        default_session = initial_session;
      };
    };
    xserver = {
      xkb.layout = "se";
      videoDrivers = ["amdgpu"];
    };
    # libinput.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
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
