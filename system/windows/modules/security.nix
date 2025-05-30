{
  pkgs,
  config,
  lib,
  ...
}: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    pam = {
      services = {
        login = {
          enableGnomeKeyring = true;
        };
      };
    };
  };
}
