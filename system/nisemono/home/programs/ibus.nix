{
  pkgs,
  config,
  lib,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-configtool
      fcitx5-m17n
      fcitx5-with-addons
      fcitx5-mozc-ut
    ];
  };
}
