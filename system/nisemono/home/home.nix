{
  config,
  pkgs,
  catppuccin,
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
      yacreader
      libnotify
      font-awesome
      noto-fonts
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      emacs-all-the-icons-fonts
      wl-clipboard
      just
      rustup
      unzip
      zip
      luarocks
      pcmanfm
      # nautilus
      grimblast
      satty
      playerctl
      pwvucontrol
      deadbeef-with-plugins
      deno
      alejandra
      xarchiver
      # vesktop
      equibop
      keybase-gui
      # nextcloud-client
      vscode
      # nicotine-plus
      pyprland
      # riseup-vpn
      wakatime
      qbittorrent
      keepassxc
      picard
      prismlauncher
      brave
      # steam-run
      osu-lazer-bin
      jellyfin-media-player
      onlyoffice-bin_latest
      lua
      ripgrep
      piper
      teamspeak6-client
      # telegram-desktop
      # floorp
      feishin

      nodePackages_latest.svelte-language-server
      nodePackages_latest.typescript-language-server
      vscode-langservers-extracted
      bash-language-server

      kdePackages.qtdeclarative

      mdformat
      cbfmt
      alejandra
      shfmt
      beautysh
      gamescope
      fuse

      wineWow64Packages.waylandFull
      minecraft

      signal-desktop
      xorg.xrandr
      mangohud
      gamemode
      # zrythm
      telegram-desktop

      # plugins for zrythm
      # helm
      # distrho-ports
      # zam-plugins

      xournalpp
      obsidian
      croc

      chatterino7
      cemu
      # parsec-bin
      moonlight-qt

      geogebra6
      inputs.ghostty.packages.x86_64-linux.default
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
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
