{
  lib,
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      # splash = true;
      # splash_offset = 2.0;
      preload = [
        "${config.home.homeDirectory}/.config/nix/.wallpapers/lain.png"
        "${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
      ];
      wallpaper = [
        # "DP-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
        "DP-1, ${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
        # "HDMI-A-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
        "HDMI-A-1, ${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
      ];
    };
  };
}
