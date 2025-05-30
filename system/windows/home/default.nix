{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./home.nix
    ./programs
  ];
}
