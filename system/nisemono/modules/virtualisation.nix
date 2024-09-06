{
  pkgs,
  lib,
  ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
