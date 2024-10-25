{
  config,
  libs,
  pkgs,
  home,
  ...
}: {
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "inode/directory" = ["pcmanfm.desktop"];
      "application/zip" = ["xarchiver.desktop"];
      "x-scheme-handler/http" = ["brave-browser.desktop"];
      "x-scheme-handler/https" = ["brave-browser.desktop"];
      "text/html" = ["brave-browser.desktop"];
      "text/css" = ["brave-browser.desktop"];
      "text/javascript" = ["brave-browser.desktop"];
      "application/pdf" = ["brave-browser.desktop"];
    };
    defaultApplications = {
      "inode/directory" = ["pcmanfm.desktop"];
      "application/zip" = ["xarchiver.desktop"];
      "x-scheme-handler/http" = ["brave-browser.desktop"];
      "x-scheme-handler/https" = ["brave-browser.desktop"];
      "text/html" = ["brave-browser.desktop"];
      "text/css" = ["brave-browser.desktop"];
      "text/javascript" = ["brave-browser.desktop"];
      "application/pdf" = ["brave-browser.desktop"];
    };
  };
}
