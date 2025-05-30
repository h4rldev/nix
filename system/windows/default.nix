{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./modules
  ];
}
