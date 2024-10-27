{
  pkgs,
  config,
  lib,
  ...
}: {
  security = {
    pam = {
      services = {
        greetd.kwallet.enable = true;
      };
    };
  };
}
