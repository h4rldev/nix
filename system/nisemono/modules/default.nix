{
  config,
  pkgs,
  catppuccin,
  hyprland,
  quickshell,
  inputs,
  lib,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.quickshell.packages.x86_64-linux.default
    ];
  };

  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./virtualisation.nix
    ./security.nix
    ./catppuccin.nix
  ];
}
