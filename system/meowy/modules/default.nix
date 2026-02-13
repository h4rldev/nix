{...}: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./services.nix
    ./programs.nix
    ./networking.nix
    ./sops.nix
  ];
}
