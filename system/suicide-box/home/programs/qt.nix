{
  pkgs,
  config,
  lib,
  catppuccin,
  ...
}: {
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
    };
  };
}
