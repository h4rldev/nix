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
        "${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
      ];
      wallpaper = [
        "eDP-1, ${config.home.homeDirectory}/.config/nix/.wallpapers/bliss.jpg"
      ];
    };
  };
}
