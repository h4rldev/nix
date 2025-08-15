{
  pkgs,
  config,
  libs,
  hyprland,
  inputs,
  stylix,
  ...
}: {
  imports = [
    ./home.nix
    ./hyprland.nix
    ./programs
    ./services
  ];
}
