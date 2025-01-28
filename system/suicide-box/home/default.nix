{
  pkgs,
  config,
  libs,
  catppuccin,
  ...
}: {
  imports = [
    ./home.nix
    ./hyprland.nix
    ./programs
  ];
}
