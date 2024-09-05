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
        "eDP-1, /home/h4rl/.config/nix/.wallpapers/lain.png"
      ];
    };
  };
}
