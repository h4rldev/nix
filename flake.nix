{
  description = "h4rls system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixinate.url = "github:matthewcroughan/nixinate";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    nixinate,
    hyprland,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
  in rec {
    apps = nixinate.nixinate.x86_64-linux self;
    nixosConfigurations = {
      suicide-box = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ({pkgs, ...}: {
            nixpkgs.config = {
              allowUnfree = true;
              allowUnfreePredicate = _: true;
            };
          })
          catppuccin.nixosModules.catppuccin
          ./global_modules
          ./system/suicide-box
        ];
      };
    };
  };
}
