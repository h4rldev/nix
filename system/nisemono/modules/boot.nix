{
  pkgs,
  config,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
        extraEntries = ''
            menuentry "Windows 10" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root A25D-66E5
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
