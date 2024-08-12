{
  config,
  pkgs,
  catppuccin,
  libs,
  ...
}: {
  imports = [
    ./networking.nix
    ./services.nix
    ./programs.nix
    ./hardware.nix
  ];
}
