{
  pkgs,
  lib,
  hyprland,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = ["hyprland" "pcmanfm"];
  };
}