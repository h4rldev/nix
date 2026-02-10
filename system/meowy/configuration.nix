{
  modulesPath,
  lib,
  pkgs,
  ...
} @ args: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
    pkgs.neovim
  ];

  users.users.root.openssh.authorizedKeys.keys =
    [
      # change this to your ssh key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFq7yY1MfXBt9iX/gfV5VsIhvqGuy0Z2QRquLc4rTENN h4rl@nisemono"
    ]
    ++ (args.extraPublicKeys or []); # this is used for unit-testing this module and can be removed if not needed

  system.stateVersion = "24.05";
}
