{
  pkgs,
  catppuccin,
  home,
  hyprland,
  ...
}: {
  services = {
    network-manager-applet.enable = true;
    playerctld.enable = true;
    arrpc.enable = true;
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
    ./fuzzel.nix
    ./kitty.nix
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./fastfetch.nix
    ./zoxide.nix
    ./mpv.nix
    ./catppuccin.nix
  ];
}
