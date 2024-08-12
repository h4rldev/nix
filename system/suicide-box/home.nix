{
  config,
  pkgs,
  libs,
  home-manager,
  ...
}: {
  modules = [
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.h4rl = {
          imports = [
            catppuccin.homeManagerModules.catppuccin
            hyprland.homeManagerModules.default
            ./home/home.nix
            ./home/hyprland.nix
            ./home/programs
          ];
        };
      };
    }
  ];
}
