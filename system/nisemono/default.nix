{
  config,
  pkgs,
  libs,
  catppuccin,
  quickshell,
  inputs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules
  ];
}
