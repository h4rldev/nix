{
  pkgs,
  config,
  libs,
  ...
}: {
  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      name = "kvantum";
    };
  };
}
