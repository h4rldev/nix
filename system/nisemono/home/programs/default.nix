{
  pkgs,
  catppuccin,
  home,
  inputs,
  stylix,
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
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./gtk.nix
    ./hyprpaper.nix
    ./wlogout.nix
    ./fastfetch.nix
    # ./emacs.nix
    ./stylix.nix
    ./mako.nix
    ./zoxide.nix
    ./catppuccin.nix
    ./ghostty.nix
    ./ibus.nix
    ./sshfs.nix
    ./hypridle.nix
    ./zed.nix
    ./brave.nix
  ];
}
