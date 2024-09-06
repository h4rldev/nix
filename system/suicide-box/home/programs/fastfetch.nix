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
      };
      modules = [
        "title"
        "seperator"
        "os"
        "host"
        "kernel"
        "uptime"
        "seperator"
        "packages"
        "shell"
        "wm"
        "terminal"
        "seperator"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "battery"
        "seperator"
        "colors"
      ];
    };
  };
}
