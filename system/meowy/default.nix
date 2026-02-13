{modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ../../global_modules/nix.nix
    ../../global_modules/system.nix
    ./modules
    ./containers
    ./configuration.nix
    ./disk-config.nix
    ./users.nix
  ];
}
