{
  pkgs,
  config,
  lib,
  catppuccin,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
        catppuccin = {
          enable = true;
          flavor = "mocha";
        };
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
