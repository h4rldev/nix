{
  lib,
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;
      preload = [
        "/home/h4rl/.config/nix/.wallpapers/lain.png"
      ];
      wallpaper = [
        "DP-2, /home/h4rl/.config/nix/.wallpapers/lain.png"
        "HDMI-A-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
      ];
    };
  };
}
