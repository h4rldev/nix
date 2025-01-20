{
  config,
  pkgs,
  libs,
  catppuccin,
  inputs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules
  ];
}
