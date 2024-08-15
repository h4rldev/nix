{
  config,
  libs,
  catppuccin,
  ...
}: {
  boot.loader = {
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
}
