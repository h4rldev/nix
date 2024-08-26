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
      xwayland.enable = true;
    };

    regreet = {
      enable = true;
      package = pkgs.greetd.regreet;
      settings = {
        background = {
          path = /home/h4rl/.config/nix/.wallpapers/lain.png;
          fit = "Cover";
        };

        GTK = {
          application_prefer_dark_theme = true;
          cursor_theme_name = lib.mkForce "catppuccin-mocha-light-cursors";
          font_name = lib.mkForce "Cantarell 16";
          icon_theme_name = lib.mkForce "Papirus-Dark";
          theme_name = lib.mkForce "catppuccin-mocha-teal-standard+default";
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
  };
}
