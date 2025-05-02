{
  lib,
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      "$big" = "DP-1";
      "$small" = "HDMI-A-1";
      "$wallpaper_dir" = config.home.homeDirectory + "/.config/nix/.wallpapers";
      ipc = true;
      # splash = true;
      # splash_offset = 2.0;
      preload = [
        # "${config.home.homeDirectory}/.config/nix/.wallpapers/lain.png"
        # "${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
        "$wallpaper_dir/pixel-car.png"
      ];
      wallpaper = [
        # "DP-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
        # "DP-1, ${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
        # "HDMI-A-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
        # "HDMI-A-1, ${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
        "$big, $wallpaper_dir/pixel-car.png"
        "$small, $wallpaper_dir/pixel-car.png"
      ];
    };
  };
}
