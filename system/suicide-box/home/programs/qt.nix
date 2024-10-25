{
  pkgs,
  config,
  lib,
  catppuccin,
  ...
}: {
  qt = {
    enable = true;
    #platformTheme = {
    #  name = "kvantum";
    #};
    #style = {
    #  name = "kvantum";
    #  catppuccin = {
    #    enable = true;
    #    flavor = "mocha";
    #    accent = lib.mkForce "teal";
    #  };
    #};
  };
}
