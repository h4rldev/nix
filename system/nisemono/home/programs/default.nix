{
  pkgs,
  catppuccin,
  home,
  inputs,
  hyprland,
  ...
}: {
  services = {
    network-manager-applet.enable = true;
    playerctld.enable = true;
    arrpc.enable = true;
    keybase.enable = true;
    kbfs.enable = true;
  };

  programs = {
    mpv.enable = true;
    imv.enable = true;
  };

  imports = [
    ./direnv.nix
    ./gh.nix
    ./git.nix
    ./gtk.nix
    ./qt.nix
    ./zsh.nix
    ./mako.nix
    ./mime.nix
    ./tofi.nix
    ./kitty.nix
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./wlogout.nix
    ./xdg-portal.nix
    ./transient-services.nix
  ];
}
