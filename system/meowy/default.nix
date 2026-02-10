{modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ../../global_modules/
    ./hardware-configuration.nix
    ./configuration.nix
    ./disk-config.nix
  ];
}
