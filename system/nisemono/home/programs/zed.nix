{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    # More packages will be added in the future potentially
    extraPackages = with pkgs; [
      alejandra
      clang-tools
      hyprls
      nil
      vue-language-server
      shellcheck
      shfmt
      nixd
      gcc
      clang
    ];

    extensions = [
      # Themes
      "catppuccin"
      "catppuccin-icons"

      # Utilities
      "wakatime"
      "discord-presence"

      # Languages & Frameworks
      "unocss"
      "assembly"
      "astro"
      "awk"
      "caddyfile"
      "cargo-appraiser"
      "dockerfile"
      "basher"
      "docker-compose"
      "env"
      "hyprlang"
      "just"
      "just-ls"
      "leptos"
      "make"
      "meson"
      "nix"
      "vue"
      "vue-snippets"
    ];

    userSettings = {
      auto_update = false;
      remove_trailing_whitespace_on_save = true;
      tab_size = 2;
      hide_mouse = "on_typing_and_movement";
      snippet_sort_order = "bottom";
      base_keymap = "VSCode";

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      journal = {
        hour_format = "hour24";
      };

      theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Mocha";
      };

      lsp = {
        discord_presence = {
          initialization_options = {
            application_id = "1263505205522337886";
            base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";
            state = "Working on {filename}";
            details = "In {workspace}";
            large_image = "{base_icons_url}/{language:lo}.png";
            large_text = "{language:u}";
            small_image = "{base_icons_url}/zed.png";
            small_text = "Zed";
            git_integration = true;

            idle = {
              timeout = 300;
              action = "change_activity";
              state = "Idling";
              details = "In Zed";
              large_image = "{base_icons_url}/zed.png";
              large_text = "Zed";
              small_image = "{base_icons_url}/idle.png";
              small_text = "Idle";
            };
          };
        };
      };

      agent = {
        default_model = {
          provider = "openrouter";
          model = "horizon-beta";
        };
      };

      features = {
        edit_prediction_provider = "supermaven";
      };

      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        copy_on_select = true;
        line_height = "comfortable";
        working_directory = "current_project_directory";

        detect_venv = {
          on = {
            directories = [".env" ".venv" "env" "venv"];
            activate_script = "default";
          };
        };
      };
    };
  };
}
