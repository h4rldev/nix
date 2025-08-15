{
  config,
  pkgs,
  catppuccin,
  hyprland,
  # quickshell,
  inputs,
  stylix,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./virtualisation.nix
    ./security.nix
    ./catppuccin.nix
    # ./stylix.nix
  ];
}
