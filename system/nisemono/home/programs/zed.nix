{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    # More packages will be added in the future potentially
    extraPackages = with pkgs; [
      alejandra
      clang-tools
      hyprls
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
      "docker-compose"
      "env"
      "hyprlang"
      "just"
      "just-ls"
      "leptos"
      "make"
      "meson"
      "nix"
    ];

    userSettings = {
      auto_update = false;
      remove_trailing_whitespace_on_save = true;
      working_directory = "current_project_directory";
      tab_size = 2;
      hide_mouse = "on_typing_and_movement";
      snippet_sort_order = "bottom";

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      journal = {
        hour_format = "hour24";
      };

      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        copy_on_select = true;
        line_height = "comfortable";

        detect_env = {
          on = {
            directories = [".env" ".venv" "env" "venv"];
            activate_script = "default";
          };
        };
      };
    };
  };
}
