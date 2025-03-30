{
  pkgs,
  config,
  lib,
  catppuccin,
  inputs,
  ...
}: {
  imports = [
    ./home.nix
    ./hyprland.nix
    ./programs
  ];
}
