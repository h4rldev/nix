{pkgs, config, libs, ...}: let
      hyprlandConfig = pkgs.writeText "greetd-hyprland-condig" ''
              monitor=DP-1, 2560x1440@165, auto, 1
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
            security.rtkit.enable = true;
            services = {
              udisks2 = {
                enable = true;
              };
              greetd = {
                enable = true;
                settings = rec {
                  initial_session = {
                    command = "hyprland --config ${hyprlandConfig}";
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
                pulse.enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                jack.enable = true;
              };
            };
}

