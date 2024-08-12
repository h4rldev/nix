{
  config,
  libs,
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
      settings = {
        background = {
          path = /etc/nixos/.wallpapers/lain.png;
          fit = "Cover";
        };

        GTK = {
          application_prefer_dark_theme = true;
          cursor_theme_name = "catppuccin-mocha-light-cursors";
          font_name = "Cantarell 16";
          icon_theme_name = "Papirus-Dark";
          theme_name = "catppuccin-mocha-teal-standard+default";
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
