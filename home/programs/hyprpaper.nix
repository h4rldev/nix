{lib, config, pkgs, ...}:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;

      preload = [
	"${config.home.homeDirectory}/.wallpapers/lain.png"
      ];
      wallpaper = [
	"eDP-1, ${config.home.homeDirectory}/.wallpapers/lain.png"
      ];
    };
  };
}
