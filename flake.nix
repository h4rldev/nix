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
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-facter-modules = {
      url = "github:nix-community/nixos-facter-modules";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    affinity-nix.url = "github:mrshmllow/affinity-nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
  };

  nixConfig = {
    extra-trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      # "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
    trusted-users = ["h4rl"];
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    nixinate,
    home-manager,
    nixos-wsl,
    ghostty,
    stylix,
    neovim-nightly-overlay,
    affinity-nix,
    spicetify-nix,
    hytale-launcher,
    disko,
    nixos-facter-modules,
    ...
  } @ inputs: let
  in {
    apps = nixinate.nixinate.x86_64-linux self;
    nixosConfigurations = {
      suicide-box = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs = {
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
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs = {
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
                  spicetify-nix.homeManagerModules.spicetify
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
      meowy = nixpkgs.lib.nixosSystem {
        nixpkgs.stdenv.hostPlatform.system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./system/meowy
          nixos-facter-modules.nixosModules.facter
          {
            config.facter.reportPath =
              if builtins.pathExists ./facter.json
              then ./facter.json
              else throw "Have you forgotten to run nixos-anywhere with `--generate-hardware-config nixos-facter ./facter.json`?";
          }
        ];
      };
      windows = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs = {
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
