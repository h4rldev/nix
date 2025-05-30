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
      EDITOR = "nvim";
    };

    pathsToLink = [
      "/share/applications"
    ];
  };
}
