{
  pkgs,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "h4rl";
  home.homeDirectory = "/home/h4rl";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;
    [
      # yacreader
      libnotify
      font-awesome
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      wl-clipboard
      rustup
      unzip
      zip
      luarocks
      pcmanfm
      grimblast
      satty
      playerctl
      pwvucontrol
      alejandra
      xarchiver
      vesktop
      equibop
      keybase-gui
      vscode
      pyprland
      wakatime-cli
      qbittorrent
      keepassxc
      prismlauncher
      osu-lazer-bin
      onlyoffice-desktopeditors
      ripgrep
      piper
      teamspeak6-client
      feishin
      glib
      fd
      imagemagick
      ghostscript
      tectonic
      mermaid-cli

      tree-sitter

      gamescope
      fuse

      wineWow64Packages.waylandFull

      signal-desktop
      mangohud
      gamemode
      # ayugram-desktop

      ouch
      xournalpp
      obsidian
      croc

      #retroarch-full
      poptracker

      moonlight-qt

      # volume
      syshud
      heroic

      # power menu
      syspower

      archipelago
      gimp
      inputs.affinity-nix.packages.x86_64-linux.v3
      inputs.hytale-launcher.packages.x86_64-linux.default
      tidal-hifi

      tinymist
      typstyle

      yacreader
      uzdoom
      qzdl
    ]
    ++ (lib.filter (e: e ? type && e.type == "derivation") (lib.attrValues pkgs.nerd-fonts));

  home.pointerCursor = {
    gtk.enable = true;
    size = 18;
    hyprcursor = {
      enable = true;
      size = 18;
    };
  };

  xdg.desktopEntries.osu-lazer-gamemode = {
    exec = "gamemoderun osu! %u";
    name = "osu! (gamemode)";
    icon = "osu";
    comment = "A free-to-win rhythm game. Rhythm is just a *click* away! (with gamemode)";
    terminal = false;
    type = "Application";
    mimeType = ["application/x-osu-beatmap-archive" "application/x-osu-skin-archive" "application/x-osu-beatmap" "application/x-osu-storyboard" "application/x-osu-replay" "x-scheme-handler/osu"];
    categories = ["Game"];
    startupNotify = true;
    settings = {
      StartupWMClass = "osu!";
      SingleMainWindow = "true";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/h4rl/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "/home/h4rl/.config/nix/"
    "/home/h4rl/.cargo/bin"
    "/home/h4rl/.bin/"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
