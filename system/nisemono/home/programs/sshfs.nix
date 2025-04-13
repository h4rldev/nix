{ config, pkgs, ... }: 
{
  systemd.user = {
    mounts = {
      "home-server" = {
        Unit = {
          Description = "SSHFS mount for my home server";
        };
        Mount = {
          What = "sshfs#home-server:/home/h4rl/";
          Where = "/home/h4rl/mounts/home-server";
          Type = "fuse.sshfs";
          Options = [
            "idmap=user"
            "AllowOther"
            "reconnect"
            "_netdev"
            "x-systemd.automount"
          ];
        };
      };
    };
  };
};
