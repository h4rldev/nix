{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./networking.nix
  #   ./services.nix
    ./programs.nix
    ./security.nix
    ./nix.nix
    ./environment.nix
  ];
}
