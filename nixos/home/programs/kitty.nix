{config, pkgs, libs, catppuccin, ...}:

{
  programs.kitty = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    settings = {
      shell_integration = true;
    };
  };
}
