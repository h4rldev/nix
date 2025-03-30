{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    settings = {
      shell_integration = true;
    };
  };
}
