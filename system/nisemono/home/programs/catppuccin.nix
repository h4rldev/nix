{
  catppuccin,
  pkgs,
  ...
}: {
  catppuccin = {
    enable = true;
    cursors = {
      enable = true;
      flavor = "mocha";
      accent = "light";
    };

    zellij = {
      enable = true;
      flavor = "mocha";
    };

    kvantum = {
      enable = true;
      flavor = "mocha";
      accent = "teal";
    };

    fcitx5 = {
      enable = true;
      apply = true;
      flavor = "mocha";
      accent = "teal";
    };

    gtk = {
      enable = true;
      flavor = "mocha";
      accent = "teal";
      icon = {
        enable = true;
        flavor = "mocha";
        accent = "teal";
      };
    };
  };
}
