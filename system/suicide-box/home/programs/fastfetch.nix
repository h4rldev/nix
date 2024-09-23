{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "~/.config/nix/.fastfetch/logo.png";
      };
      display = {
        size.binaryPrefix = "si";
        color = "red";
        separator = "  - ";
        constants = [
          "──────────────────────"
        ];
        key = {
          type = "icon";
          paddingLeft = 2;
        };
      };
      modules = [
        {
          type = "custom"; # HardwareStart
          # {#1} is equivalent to `\u001b[1m`. {#} is equivalent to `\u001b[m`
          format = "┌{$1} {#1}hardware{#} {$1}┐";
        }
        "host"
        "cpu"
        "gpu"
        "disk"
        "memory"
        "swap"
        "display"
        "sound"
        {
          type = "custom"; # SoftwareStart
          format = "├{$1} {#1}software{#} {$1}┤";
        }
        {
          type = "title";
          keyIcon = "";
          key = "Title";
          format = "{user-name}@{host-name}";
        }
        "os"
        "kernel"
        "lm"
        "de"
        "wm"
        "shell"
        "terminal"
        "terminalfont"
        "theme"
        "icons"
        "wallpaper"
        "packages"
        "uptime"
        "media"
        {
          type = "localip";
          compact = true;
        }
        {
          type = "publicip";
          timeout = 1000;
        }
        "locale"
        {
          type = "custom"; # InformationEnd
          format = "└{$1}──────────{$1}┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
