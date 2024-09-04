{
  pkgs,
  libs,
  config,
  ...
}: {
  services.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font";
    icons = true;
    maxIconSize = 128;
    defaultTimeout = 2000;
    layer = "overlay";
    anchor = "bottom-right";
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    extraConfig = "[urgency=high]\nborder-color=#fab387";
  };
}
