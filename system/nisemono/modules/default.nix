{
  config,
  pkgs,
  catppuccin,
  hyprland,
  libs,
  ...
}: {
  imports = [
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./virtualisation.nix
    # ./hardware.nix
  ];
}
