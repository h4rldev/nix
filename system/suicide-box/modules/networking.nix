{
  pkgs,
  config,
  libs,
  ...
}: {
  networking.hostName = "suicide-box"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [25565];
  networking.firewall.allowedUDPPorts = [25565];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
