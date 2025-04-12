{
  config,
  pkgs,
  libs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "h4rl";
    userEmail = "h4rldev@proton.me";
    signing = {
      signByDefault = true;
      key = "716535E74ECE0F94A4391E6AB69EFF282C4538F4";
    };
    includes = [
      {
        condition = "gitdir:~/projects/nagai/";
        path = "~/projects/nagai/.gitconfig";
      }
    ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
