{lib, config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    plugins = [
      {
	name = "zsh-nix-shell";
	file = "nix-shell.plugin.zsh";
	src = pkgs.fetchFromGitHub {
	  owner = "chisui";
	  repo = "zsh-nix-shell";
	  rev = "v0.8.0";
	  sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
	};
      }
      {
	name = "zsh-zellij";
	file = "zsh-zellij.zsh";
	src = ../zsh;
      }
      {
	name = "powerlevel10k";
	src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
	file = "powerlevel10k.zsh-theme";
      }
      {
	name = "powerlevel10k-config";
	src = ../zsh;
	file = ".p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
	"git"
	"rust"
	"direnv"
      ];
    };
  };
}
