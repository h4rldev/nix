{
  config,
  pkgs,
  libs,
  catppuccin,
  ...
}: {
  programs.wezterm = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    extraConfig = ''
      return {
        font = wezterm.font("JetBrainsMono Nerd Font"),
      }
    '';
    enableZshIntegration = true;
  };
}
