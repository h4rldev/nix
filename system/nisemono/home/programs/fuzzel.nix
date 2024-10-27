{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        font = "JetBrainsMono Nerd Font:size=16";
        dpi-aware = "yes";
        # show-actions = "yes";
        width = 100;
      };

      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "94e2d5ff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "94e2d5ff";
        counter = "7f849cff";
        border = "94e2d5ff";
      };
    };
  };
}
