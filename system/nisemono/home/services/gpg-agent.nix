{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableSshSupport = true;
  };
}
