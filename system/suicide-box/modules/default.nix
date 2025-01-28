{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./hardware.nix
    ./catppuccin.nix
  ];
}
