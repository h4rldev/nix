{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./system.nix
    ./networking.nix
  #   ./services.nix
    ./programs.nix
    ./security.nix
    ./nix.nix
    ./environment.nix
  ];
}
