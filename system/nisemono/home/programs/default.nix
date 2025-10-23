{
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs = {
    mpv.enable = true;
    imv.enable = true;
    hyprlock.enable = true;
    element-desktop.enable = true;
    chromium.enable = true;
    fuzzel.enable = true;

    element-desktop = {
      package = pkgs.element-desktop.overrideAttrs (old: {
        desktopItem = pkgs.makeDesktopItem {
          name = "element-desktop";
          exec = "element-desktop %u --password-store=gnome-libsecret";
          icon = "element";
          desktopName = "Element";
          genericName = "Matrix Client";
          comment = old.meta.description;
          categories = [
            "Network"
            "InstantMessaging"
            "Chat"
          ];
          startupWMClass = "Element";
          mimeTypes = [
            "x-scheme-handler/element"
            "x-scheme-handler/io.element.desktop"
          ];
        };
      });
    };

    chromium = {
      package = pkgs.brave;

      extensions = [
        "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
        "kpmjjdhbcfebfjgdnpjagcndoelnidfj" # Control Panel for Twitter
        "cofdbpoegempjloogbagkncekinflcnj" # DeepL Translator
        "agnaejlkbiiggajjmnpmeheigkflbnoo" # Discord Rich Presence
        "ponfpcnoihfmfllpaingbgckeeldkhle" # Enhancer for YouTube
        "edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
        "fkagelmloambgokoeokbpihmgpkbgbfm" # Indie Wiki Buddy
        "kekjfbackdeiabghhcdklcdoekaanoel" # MAL-Sync
        "nbcjlcokgigjfhejofmbaomcimggiafn" # movie-web remastered extension
        "nbdpnlpphdfoodlknhfphenniclnjcgl" # nothx
        "agjnjboanicjcpenljmaaigopkgdnihi" # PreMiD
        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
        "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam: Find song names from your browser
        "ijcpiojgefnkmcadacmacogglhjdjphj" # Shinigami Eyes
        "mafpmfcccpbjnhfhjnllmmalhifmlcie" # Snowflake
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube - Skip Sponsorships
        "clngdbkpkpeebahjckkjfobafhncgmne" # Stylus
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "cbghhgpcnddeihccjmnadmkaejncjndb" # Vencord Web
      ];
      commandLineArgs = [
        "--hide-crash-restore-bubble"
        "--disable-features=WaylandWpColorManagerV1"
      ];
    };
    fuzzel = {
      settings = {
        main = {
          terminal = "${inputs.ghostty.packages.x86_64-linux.default}/bin/ghostty";
          layer = "overlay";
          font = lib.mkForce "JetBrainsMono Nerd Font:size=16";
          dpi-aware = "yes";
          width = 100;
        };
      };
    };
  };

  imports = [
    ./direnv.nix
    ./git.nix
    ./qt.nix
    ./zsh.nix
    ./mime.nix
    ./fuzzel.nix
    ./waybar.nix
    ./zellij.nix
    ./udiskie.nix
    ./hyprlock.nix
    ./gtk.nix
    ./hyprpaper.nix
    ./wlogout.nix
    ./fastfetch.nix
    ./stylix.nix
    ./mako.nix
    ./zoxide.nix
    ./catppuccin.nix
    ./ghostty.nix
    ./ibus.nix
    ./sshfs.nix
    ./hypridle.nix
    ./xdg-portal.nix
    ./zed.nix
    ./brave.nix
    ./carapace.nix
    # ./nushell.nix
  ];
}
