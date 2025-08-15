{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      net
      skim
      dbus
      query
      gstat
      semver
      formats
      highlight
    ];

    settings = {
      buffer_editor = "nvim";
    };

    extraConfig = ''
      source "../nu/oh-my-v2.nu"
    '';
  };
}
