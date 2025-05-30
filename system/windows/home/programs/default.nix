{
  pkgs,
  home,
  inputs,
  ...
}: {
  imports = [
    ./direnv.nix
    ./gh.nix
    ./git.nix
    ./zsh.nix
    ./zellij.nix
    ./fastfetch.nix
    ./zoxide.nix
  ];
}
