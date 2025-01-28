{
  config,
  lib,
  pkgs,
  catppuccin,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

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
      xwayland.enable = true;
    };

    regreet = {
      enable = true;
      package = pkgs.greetd.regreet;

      theme = {
        name = "catppuccin-mocha-teal-standard+default";
        package = pkgs.catppuccin-gtk;
      };

      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 16;
        name = "JetBrainsMono Nerd Font";
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      cursorTheme = {
        name = "catppuccin-mocha-light-cursors";
        package = pkgs.catppuccin-cursors;
      };

      settings = {
        background = {
          path = "${config.users.users.h4rl.home}/.config/nix/.wallpapers/bliss.jpg";
          fit = "Cover";
        };

        GTK = {
          application_prefer_dark_theme = true;
          # cursor_theme_name = lib.mkForce "catppuccin-mocha-light-cursors";
          # font_name = lib.mkForce "Cantarell 16";
          # icon_theme_name = lib.mkForce "Papirus-Dark";
          # theme_name = lib.mkForce "catppuccin-mocha-teal-standard+default";
        };

        commands = {
          reboot = ["systemctl" "reboot"];
          poweroff = ["systemctl" "poweroff"];
        };
      };
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

    adb.enable = true;
  };
}
