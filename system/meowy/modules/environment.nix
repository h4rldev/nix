{
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    map lib.lowPrio [
      curl
      gitMinimal
      neovim
    ];
}
