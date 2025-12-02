{pkgs, ...}: {
  security = {
    pam = {
      loginLimits = [
        {
          domain = "@audio";
          type = "hard";
          item = "memlock";
          value = "unlimited";
        }
        {
          domain = "@audio";
          type = "hard";
          item = "rtprio";
          value = "99";
        }
      ];

      services = {
        greetd = {
          enableGnomeKeyring = true;
          kwallet = {
            enable = true;
            package = pkgs.kdePackages.kwallet-pam;
          };
        };

        kwallet.kwallet = {
          enable = true;
          package = pkgs.kdePackages.kwallet-pam;
        };

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
