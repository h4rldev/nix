{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
    };

    # extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    # extraModprobeConfig = ''
    #   options v4l2loopback devices=1 video_nr=3 card_label="OBS Cam" exclusive_caps=1
    # '';
  };
}
