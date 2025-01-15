{
  pkgs,
  config,
  libs,
  ...
}: {
  networking = {
    hostName = "suicide-box"; # Define your hostname.
    networkmanager.enable = true; # Easiest to use and most distros use this by default.

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [25565];
      allowedTCPPortRanges = [
        {
          from = 45000;
          to = 47000;
        }
      ];
      allowedUDPPorts = [25565];
      # Or disable the firewall altogether.
      enable = true;
    };
  };
}
