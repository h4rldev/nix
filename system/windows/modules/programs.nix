{
  config,
  lib,
  pkgs,
  ...
}: {
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    nh = {
      enable = true;
      clean.enable = true;
      flake = "${config.users.users.h4rl.home}/.config/nix";
    };

    # ssh = {
    #   extraConfig = ''
    #     Host vps-server
    #       HostName 37.27.196.202
    #       User root
    #       Port 32456
    #       IdentityFile ${config.users.users.h4rl.home}/.ssh/h4rl-nisemono
    # 
    #     Host home-server
    #       HostName 192.168.50.47
    #       Port 22345
    #       User h4rl
    #       IdentityFile ${config.users.users.h4rl.home}/.ssh/h4rl-nisemono
    #
    #     Host eversiege
    #       HostName 158.220.125.82
    #       User root
    #       IdentityFile ${config.users.users.h4rl.home}/.ssh/h4rl-nisemono
    #
    #     Host rambo
    #       HostName 149.56.223.249
    #       User oliver
    #       IdentityFile ${config.users.users.h4rl.home}/.ssh/h4rl-nisemono
    #   '';
    # };
  };
}
