{
  pkgs,
  config,
  libs,
  ...
}: {
  imports = [
    ./home.nix
    ./hyprland.nix
    ./programs
  ];
}
