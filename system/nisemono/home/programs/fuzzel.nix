{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${inputs.ghostty.packages.x86_64-linux.default}/bin/ghostty";
        layer = "overlay";
        font = lib.mkForce "JetBrainsMono Nerd Font:size=16";
        dpi-aware = "yes";
        # show-actions = "yes";
        width = 100;
      };
    };
  };
}
