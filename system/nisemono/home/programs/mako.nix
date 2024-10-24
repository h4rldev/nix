{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.tofi = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font";
      font-size = 18;

      prompt-text = ">";
      prompt-padding = 10;
      border-width = 4;
      outline-width = 0;
      width = "75%";
      height = "50%";
      corner-radius = 15;

      text-cursor = true;
      text-color = "#cdd6f4";
      text-cursor-color = "#f38ba8";
      prompt-color = "#f38ba8";
      selection-color = "#cba6f7";
      border-color = "#94e2d5cc";
      background-color = "#1e1e2eCC";
    };
  };
}
