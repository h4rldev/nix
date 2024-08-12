{
  pkgs,
  libs,
  config,
  catppuccin,
  ...
}: {
  imports = [
    ./modules
    ./configuration.nix
    ./hardware-configuration.nix
  ];
}
