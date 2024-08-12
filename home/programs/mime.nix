{config, libs, pkgs, home, ...}:

{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "inode/directory" = ["pcmanfm.desktop"];
      "x-scheme-handler/http" = ["floorp.desktop"];
      "x-scheme-handler/https" = ["floorp.desktop"];
      "text/html" = ["floorp.desktop"];
      "text/css" = ["floorp.desktop"];
      "text/javascript" = ["floorp.desktop"];
      "application/pdf" = ["floorp.desktop"];
    };
    defaultApplications = {
      "inode/directory" = ["pcmanfm.desktop"];
      "x-scheme-handler/http" = ["floorp.desktop"];
      "x-scheme-handler/https" = ["floorp.desktop"];
      "text/html" = ["floorp.desktop"];
      "text/css" = ["floorp.desktop"];
      "text/javascript" = ["floorp.desktop"];
      "application/pdf" = ["floorp.desktop"];
    };
  };
}
