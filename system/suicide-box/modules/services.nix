{
  pkgs,
  config,
  lib,
  ...
}: let
  hyprlandConfig = pkgs.writeText "greetd-hyprland-condig" ''
    monitor=eDP-1, 1920x1080@60, auto, 1
    exec-once=hyprctl dispatch movecursor 960 540
    env = XCURSOR_SIZE,24
    animations {
      enabled = no
    }

    misc {
      force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
    }

    $setMouse = hyprctl setcursor catppuccin-mocha-light 24
    exec-once = $setMouse & ${config.programs.regreet.package}/bin/regreet; hyprctl dispatch exit
  '';
in {
  # services
  services = {
    udisks2 = {
      enable = true;
    };
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
      videoDrivers = ["nvidia"];
    };
    libinput.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
