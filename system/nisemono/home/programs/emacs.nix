{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
}
