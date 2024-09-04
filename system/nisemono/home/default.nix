{
  pkgs,
  config,
  libs,
  hyprland,
  inputs,
  ...
}: {
  imports = [
    ./home.nix
    ./hyprland.nix
    ./programs
  ];
}
