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
        "/etc/nixos/.wallpapers/lain.png"
      ];
      wallpaper = [
        "eDP-1, /etc/nixos/.wallpapers/lain.png"
      ];
    };
  };
}
