{
  description = "h4rls system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixinate.url = "github:matthewcroughan/nixinate";
    prism-launcher.url = "github:PrismLauncher/PrismLauncher";
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
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
    prism-launcher,
    nixos-wsl,
    ghostty,
    stylix,
    neovim-nightly-overlay,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    overlays = [
      # hyprland.overlays.default
      prism-launcher.overlays.default
    ];
  in {
    apps = nixinate.nixinate.x86_64-linux self;
    nixosConfigurations = {
      suicide-box = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs = {
              overlays = overlays;
              config = {
                permittedInsecurePackages = [
                  # "electron-33.4.11"
                  # "qtwebengine-5.15.19"
                  # "olm-3.2.16"
                ];
                allowUnfree = true;
                allowUnfreePredicate = _: true;
              };
            };
          }
          stylix.nixosModules.stylix
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
                  # hyprland.homeManagerModules.default
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
            nixpkgs = {
              overlays = overlays;
              config = {
                permittedInsecurePackages = [
                  # "electron-33.4.11"
                  # "qtwebengine-5.15.19"
                  # "olm-3.2.16"
                ];
                allowUnfree = true;
                allowUnfreePredicate = _: true;
              };
            };
          }
          stylix.nixosModules.stylix
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
                  stylix.homeModules.stylix
                  catppuccin.homeModules.catppuccin
                  # hyprland.homeManagerModules.default
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
          {
            nixpkgs = {
              overlays = overlays;
              config = {
                permittedInsecurePackages = [
                  # "electron-33.4.11"
                  # "qtwebengine-5.15.19"
                  # "olm-3.2.16"
                ];
                allowUnfree = true;
                allowUnfreePredicate = _: true;
              };
            };
          }
          nixos-wsl.nixosModules.default
          {
            wsl = {
              enable = true;
              defaultUser = "h4rl";
              wslConf = {
                network.hostname = "windows";
                user.default = "h4rl";
              };
            };
          }

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
    devShells.x86_64-linux.default = let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          nix-prefetch
          nurl
          nixd
        ];
      };
  };
}
