{
  pkgs,
  config,
  libs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      fastfetch
      wget
      curl
      gcc
      clang
      openssl
      nodejs
      lshw
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      EDITOR = "nvim";
    };
  };
}
