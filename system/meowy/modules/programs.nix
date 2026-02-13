{pkgs, config, ...}:
{
  programs = {
    zsh.enable = true;
    nh.enable = true;
    nix-ld.enable = true;
    git.enable = true;
    mtr.enable = true;

    zsh = {
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh.enable = true;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };

    nh = {
      clean.enable = true;
      flake = "${config.users.users.h4rl.home}/.config/nix";
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    git.config = {
      user = {
        name = "h4rl";
        email = "h4rldev@proton.me";
	signingkey = "716535E74ECE0F94A4391E6AB69EFF282C4538F4";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
