{
  pkgs,
  config,
  libs,
  ...
}: {
  imports = [
    ./nix.nix
    ./boot.nix
    ./system.nix
    ./environment.nix
  ];
}
