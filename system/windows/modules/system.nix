{config, lib, pkgs, ...}:
{
  users = {
    defaultUserShell = pkgs.zsh;
    users.h4rl = {
      isNormalUser = true;
      extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    };
  };
}
