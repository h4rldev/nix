{
  config,
  lib,
  pkgs,
  catppuccin,
  ...
}: {
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "teal";
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprland = {
      enable = true;
    };

    regreet = {
      enable = true;
      package = pkgs.greetd.regreet;
      theme = {
        name = "catppuccin-mocha-teal-standard+default";
        package = pkgs.catppuccin-gtk;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      cursorTheme = {
        name = "catppuccin-mocha-light-cursors";
        package = pkgs.catppuccin-cursors;
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 16;
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      settings = {
        background = {
          path = "${config.users.users.h4rl.home}/.config/nix/.wallpapers/bliss.jpg";
          fit = "Cover";
        };

        GTK = {
          application_prefer_dark_theme = true;
        };

        appearance = {
          greeting_msg = "Welcome back!";
        };

        commands = {
          reboot = ["systemctl" "reboot"];
          poweroff = ["systemctl" "poweroff"];
        };
      };
    };

    virt-manager = {
      enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
