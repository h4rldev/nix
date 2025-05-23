{
  pkgs,
  lib,
  config,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
      font = lib.mkForce "JetBrainsMono Nerd Font";
      icons = true;
      max-icon-size = lib.mkForce 128;
      default-timeout = lib.mkForce 2000;
      layer = lib.mkForce "overlay";
      anchor = lib.mkForce "bottom-right";
      background-color = lib.mkForce "#1e1e2e";
      text-color = lib.mkForce "#cdd6f4";
      border-color = lib.mkForce "#89b4fa";
      progress-color = lib.mkForce "over #313244";

      "urgency=high" = {
        border-color = lib.mkForce "#fab387";
      };
    };
  };
}
