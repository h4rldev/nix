{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.hyfetch = {
    enable = true;
  };
}
