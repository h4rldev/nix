{
  catppuccin,
  config,
  lib,
  ...
}: {
  catppuccin = {
    enable = true;
    grub = {
      enable = true;
      flavor = "mocha";
    };
  };
}
