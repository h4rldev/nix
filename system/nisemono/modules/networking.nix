{
  pkgs,
  config,
  libs,
  ...
}: {
  networking.hostName = "nisemono"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [45427 25567];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
