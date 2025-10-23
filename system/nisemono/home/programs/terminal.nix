{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    lazygit.enable = true;
    gh.enable = true;

    zoxide.enable = true;
    direnv.enable = true;
    zellij.enable = true;
    git.enable = true;
    ghostty.enable = true;
    zsh.enable = true;
    fastfetch.enable = true;

    zoxide = {
      enableZshIntegration = true;
    };

    direnv = {
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zellij = {
      settings = {
        copy_command = "wl-copy";
        default_mode = "locked";
        show_startup_tips = false;
      };
    };
    git = {
      settings = {
        user = {
          name = "h4rl";
          email = "h4rldev@proton.me";
        };
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
      };
      signing = {
        signByDefault = true;
        key = "716535E74ECE0F94A4391E6AB69EFF282C4538F4";
      };
      includes = [
        {
          condition = "gitdir:~/projects/nagai/";
          path = "~/projects/nagai/.gitconfig";
        }
      ];
    };

    ghostty = {
      package = inputs.ghostty.packages.x86_64-linux.default;
      enableZshIntegration = true;
      installBatSyntax = true;
      installVimSyntax = true;
      settings = {
        gtk-titlebar = true;
        gtk-toolbar-style = "flat";
        gtk-titlebar-hide-when-maximized = true;
        gtk-titlebar-style = "tabs";
        gtk-wide-tabs = true;
        gtk-tabs-location = "top";
        desktop-notifications = true;
        async-backend = "auto";
        window-decoration = "client";
        # command = "nu";
      };
    };

    zsh = {
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
        {
          name = "zsh-zellij";
          file = "zsh-zellij.zsh";
          src = ../zsh;
        }
        {
          name = "powerlevel10k";
          src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
          file = "powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ../zsh;
          file = ".p10k.zsh";
        }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "rust"
          "direnv"
        ];
      };
    };

    fastfetch = {
      settings = {
        logo = {
          type = "kitty-direct";
          source = "~/.config/nix/.fastfetch/logo.png";
        };
        display = {
          size.binaryPrefix = "si";
          color = "red";
          separator = "  - ";
          constants = [
            "──────────────────────"
          ];
          key = {
            type = "icon";
            paddingLeft = 2;
          };
        };
        modules = [
          {
            type = "custom"; # HardwareStart
            # {#1} is equivalent to `\u001b[1m`. {#} is equivalent to `\u001b[m`
            format = "┌{$1} {#1}hardware{#} {$1}┐";
          }
          "host"
          "cpu"
          "gpu"
          "disk"
          "memory"
          "swap"
          "display"
          "sound"
          {
            type = "custom"; # SoftwareStart
            format = "├{$1} {#1}software{#} {$1}┤";
          }
          {
            type = "title";
            keyIcon = "";
            key = "Title";
            format = "{user-name}@{host-name}";
          }
          "os"
          "kernel"
          "lm"
          "de"
          "wm"
          "shell"
          "terminal"
          "terminalfont"
          "theme"
          "icons"
          "wallpaper"
          "packages"
          "uptime"
          "media"
          {
            type = "localip";
            compact = true;
          }
          "locale"
          {
            type = "custom"; # InformationEnd
            format = "└{$1}──────────{$1}┘";
          }
          {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
          }
        ];
      };
    };
  };
}
