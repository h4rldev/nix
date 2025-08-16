{pkgs, ...}: let
  nushellScripts = ../nu;
in {
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      # net
      skim
      # dbus
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
      use ${nushellScripts}/power.nu
          use ${nushellScripts}/power_git.nu
          power inject 0 1 {source: git,   color: '#504945'}
          use ${nushellScripts}/power_kube.nu
          power inject 1 2 {source: kube,  color: '#504945'} {
              context: cyan
          } {
              reverse: true
              separator: '@'
          }
          use ${nushellScripts}/power_utils.nu
          power inject 0 1 {source: atuin, color: '#4C4B4A'}
          power set time null { style: compact }
      power init
    '';
  };
}
