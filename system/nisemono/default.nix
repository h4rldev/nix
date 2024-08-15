{config, pkgs, libs, catppuccin, ...}: {
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules
  ];
}
