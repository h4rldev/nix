{
  config,
  libs,
  pkgs,
  ...
}: {
  time.timeZone = "Europe/Stockholm";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.h4rl = {
      isNormalUser = true;
      extraGroups = ["wheel" "adbusers"]; # Enable ‘sudo’ for the user.
    };
  };
}
