{
  pkgs,
  lib,
  config,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 3600;
          on-timeout = "hyprlock";
        }
        {
          timeout = 7200;
          on-timeout = "systemctl poweroff";
        }
      ];
    };
  };
}
