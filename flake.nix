{
  description = "h4rls system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixinate.url = "github:matthewcroughan/nixinate";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    prism-launcher.url = "github:PrismLauncher/PrismLauncher";
    ghostty.url = "github:ghostty-org/ghostty";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  nixConfig = {
    extra-trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    trusted-users = ["h4rl"];
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    nixinate,
    home-manager,
    hyprland,
    prism-launcher,
    nixos-wsl,
    ghostty,
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
    overlays = [
      hyprland.overlays.default
      prism-launcher.overlays.default
    ];
  in rec {
    apps = nixinate.nixinate.x86_64-linux self;
    nixosConfigurations = {
      suicide-box = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs.overlays = overlays;
          }
          ({pkgs, ...}: {
            nixpkgs.config = {
              allowUnfree = true;
              allowUnfreePredicate = _: true;
              allowBroken = true;
              allowBrokenPredicate = _: true;
            };
          })
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.h4rl = {
                home.homeDirectory = "/home/h4rl";
                imports = [
                  catppuccin.homeModules.catppuccin
                  hyprland.homeManagerModules.default
                  ./system/suicide-box/home
                ];
              };
            };
          }
          ./global_modules
          ./system/suicide-box
        ];
      };
      nisemono = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs.overlays = overlays;
            nixpkgs.config.permittedInsecurePackages = [
              "electron-33.4.11"
            ];
          }
          ({pkgs, ...}: {
            nixpkgs.config = {
              allowUnfree = true;
              allowUnfreePredicate = _: true;
              allowBroken = true;
              allowBrokenPredicate = _: true;
            };
          })
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.h4rl = {
                home.homeDirectory = "/home/h4rl";
                imports = [
                  catppuccin.homeModules.catppuccin
                  hyprland.homeManagerModules.default
                  ./system/nisemono/home
                ];
              };
            };
          }
          ./global_modules
          ./system/nisemono
        ];
      };
      windows = nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = {inherit inputs;};
	modules = [
	  nixos-wsl.nixosModules.default
          {
	    wsl.enable = true;
	    wsl.defaultUser = "h4rl";
	  }
	  {
	    nixpkgs.overlays = overlays;
	  }
	  ({pkgs, ...}: {
            nixpkgs.config = {
              allowUnfree = true;
	      allowUnfreePredicate = _: true;
	    };
	  })
	  home-manager.nixosModules.home-manager
	  {
            home-manager = {
              useGlobalPkgs = true;
	      useUserPackages = true;
	      extraSpecialArgs = {inherit inputs;};
	      users.h4rl = {
                home.homeDirectory = "/home/h4rl";
		imports = [
		  ./system/windows/home
		];
	      };
	    };
	  }
	  ./system/windows
	];
      };
    };
  };
}
