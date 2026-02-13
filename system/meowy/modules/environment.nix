{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs;
    map lib.lowPrio [
      curl
      neovim
      compose2nix

      (pkgs.writeShellScriptBin "update-nix" ''
      ${builtins.readFile ../../../update-nix}
       '')
    ];
}
