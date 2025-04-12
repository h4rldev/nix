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
    ./qt.nix
    ./zsh.nix
    ./mime.nix
    ./fuzzel.nix
    ./foot.nix
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./gtk.nix
    ./hyprpaper.nix
    ./wlogout.nix
    ./fastfetch.nix
    # ./emacs.nix
    ./mako.nix
    ./zoxide.nix
    ./catppuccin.nix
    ./ghostty.nix
    ./ibus.nix
  ];
}
