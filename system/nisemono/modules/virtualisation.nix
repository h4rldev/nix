{
  pkgs,
  lib,
  ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    containerd.enable = true;
    docker.enable = true;
  };
}
