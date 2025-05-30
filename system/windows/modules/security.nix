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
          kwallet = {
            enable = true;
            package = pkgs.kdePackages.kwallet-pam;
          };
        };
      };
    };
  };
}
