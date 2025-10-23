{pkgs, ...}: {
  users.groups.libvirtd.members = ["h4rl"];
  virtualisation = {
    spiceUSBRedirection.enable = true;
    containerd.enable = true;
    docker.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
}
