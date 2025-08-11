{
  config,
  pkgs,
  libs,
  catppuccin,
  # quickshell,
  stylix,
  inputs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules
  ];
}
