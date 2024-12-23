{
  pkgs,
  lib,
  config,
  ...
}: {
  services.mako = {
    enable = true;
    font = lib.mkForce "JetBrainsMono Nerd Font";
    icons = true;
    maxIconSize = lib.mkForce 128;
    defaultTimeout = lib.mkForce 2000;
    layer = lib.mkForce "overlay";
    anchor = lib.mkForce "bottom-right";
    backgroundColor = lib.mkForce "#1e1e2e";
    textColor = lib.mkForce "#cdd6f4";
    borderColor = lib.mkForce "#89b4fa";
    progressColor = lib.mkForce "over #313244";
    extraConfig = lib.mkForce "[urgency=high]\nborder-color=#fab387";
  };
}
