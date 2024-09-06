{
  pkgs,
  config,
  libs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      gcc
      clang
      openssl
      nodejs
      lshw
      ntfs3g
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      EDITOR = "nvim";
    };

    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
  };
}
