# Won't use yet, cause my terminal doesn't really like it
{pkgs, ...}: let
  nushellScripts = ../nu;
in {
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      # net
      skim
      # dbus
      query
      gstat
      semver
      formats
      highlight
    ];

    settings = {
      buffer_editor = "nvim";
    };

    extraConfig = ''
      source ${nushellScripts}/oh-my-v2.nu

      $env.PROMPT_COMMAND = { (get_prompt 8bit).left_prompt }
      $env.PROMPT_COMMAND_RIGHT = { (get_prompt 8bit).right_prompt }
      $env.PROMPT_INDICATOR = { "" }
    '';
  };
}
