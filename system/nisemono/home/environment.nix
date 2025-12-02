{
  pkgs,
  inputs,
  ...
}: {
  qt.enable = true;
  gtk.enable = true;
  i18n.inputMethod.enable = true;
  stylix.enable = true;

  i18n.inputMethod = {
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
      fcitx5-m17n
      qt6Packages.fcitx5-with-addons
      fcitx5-mozc-ut
    ];
  };

  xdg = {
    portal.enable = true;
    mimeApps.enable = true;

    portal = {
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };

    mimeApps = {
      associations.added = {
        "inode/directory" = ["pcmanfm.desktop"];
        "application/zip" = ["xarchiver.desktop"];
        "x-scheme-handler/http" = ["brave-browser.desktop"];
        "x-scheme-handler/https" = ["brave-browser.desktop"];
        "text/html" = ["brave-browser.desktop"];
        "text/css" = ["brave-browser.desktop"];
        "text/javascript" = ["brave-browser.desktop"];
        "application/pdf" = ["brave-browser.desktop"];
        "x-osu-skin-archive" = ["osu!.desktop"];
        "x-osu-beatmap-archive" = ["osu!.desktop"];
        "x-osu-beatmap" = ["osu!.desktop"];
        "x-osu-storyboard" = ["osu!.desktop"];
        "x-osu-replay" = ["osu!.desktop"];
      };
      defaultApplications = {
        "inode/directory" = ["pcmanfm.desktop"];
        "application/zip" = ["xarchiver.desktop"];
        "x-scheme-handler/http" = ["brave-browser.desktop"];
        "x-scheme-handler/https" = ["brave-browser.desktop"];
        "text/html" = ["brave-browser.desktop"];
        "text/css" = ["brave-browser.desktop"];
        "text/javascript" = ["brave-browser.desktop"];
        "application/pdf" = ["brave-browser.desktop"];
        "x-osu-skin-archive" = ["osu!.desktop"];
        "x-osu-beatmap-archive" = ["osu!.desktop"];
        "x-osu-beatmap" = ["osu!.desktop"];
        "x-osu-storyboard" = ["osu!.desktop"];
        "x-osu-replay" = ["osu!.desktop"];
      };
    };
  };

  gtk = {
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  stylix = {
    autoEnable = true;
    polarity = "dark";
    base16Scheme = {
      system = "base16";
      name = "Catppuccin Mocha";
      author = "https://github.com/catppuccin/catppuccin";
      variant = "dark";
      palette = {
        base00 = "#1e1e2e"; # base
        base01 = "#181825"; # mantle
        base02 = "#313244"; # surface0
        base03 = "#45475a"; # surface1
        base04 = "#585b70"; # surface2
        base05 = "#cdd6f4"; # text
        base06 = "#f5e0dc"; # rosewater
        base07 = "#b4befe"; # lavender
        base08 = "#f38ba8"; # red
        base09 = "#fab387"; # peach
        base0A = "#f9e2af"; # yellow
        base0B = "#a6e3a1"; # green
        base0C = "#94e2d5"; # teal
        base0D = "#89b4fa"; # blue
        base0E = "#cba6f7"; # mauve
        base0F = "#f2cdcd"; # flamingo
      };
    };

    cursor = {
      name = "catppuccin-mocha-light-cursors";
      package = inputs.catppuccin.packages.${pkgs.system}.cursors;
      size = 18;
    };

    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji-blob-bin;
        name = "Noto Color Emoji";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };

    image = null;

    icons = {
      enable = true;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
      package = pkgs.catppuccin-papirus-folders;
    };

    targets = {
      hyprland.enable = false;
      zed.enable = false;
      qt.enable = true;
      gtk.enable = true;
    };
  };
}
