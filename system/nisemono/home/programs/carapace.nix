{pkgs, ...}: {
  # Fucks up completions rather than supporting it right now, will keep in case it gets better
  programs.carapace = {
    enable = false;
    enableZshIntegration = false;
    # enableNushellIntegration = true;
  };
}
