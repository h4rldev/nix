{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
        circular = true;
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
        circular = true;
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
        circular = true;
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
        circular = true;
      }
    ];
    style = lib.mkForce ''
           @define-color rosewater #f5e0dc;
           @define-color flamingo #f2cdcd;
           @define-color pink #f5c2e7;
           @define-color mauve #cba6f7;
           @define-color red #f38ba8;
           @define-color maroon #eba0ac;
           @define-color peach #fab387;
           @define-color yellow #f9e2af;
           @define-color green #a6e3a1;
           @define-color teal #94e2d5;
           @define-color sky #89dceb;
           @define-color sapphire #74c7ec;
           @define-color blue #89b4fa;
           @define-color lavender #b4befe;
           @define-color text #cdd6f4;
           @define-color subtext1 #bac2de;
           @define-color subtext0 #a6adc8;
           @define-color overlay2 #9399b2;
           @define-color overlay1 #7f849c;
           @define-color overlay0 #6c7086;
           @define-color surface2 #585b70;
           @define-color surface1 #45475a;
           @define-color surface0 #313244;
           @define-color base #1e1e2e;
           @define-color mantle #181825;
           @define-color crust #11111b;

           * {
      background-image: none;
      box-shadow: none;
           }

           window {
             background-color: rgba(0, 0, 0, 0);
           }

           button {
             border-radius: 0px;
             border-color: @mantle;
      text-decoration-color: @teal;
             color: @text;
      background-color: @base;
      border-style: solid;
      border-width: 4px;
             margin: 0 6px;
      background-repeat: no-repeat;
      background-position: center;
      background-size: 25%;
           }

           button:hover {
             border-color: @text;
           }

           #lock {
             background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/lock.png"));
           }

           #logout {
             background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/logout.png"));
           }

           #reboot {
             background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/reboot.png"));
           }

           #shutdown {
             background-image: image(url("${config.programs.wlogout.package}/share/wlogout/icons/shutdown.png"));
           }
    '';
  };
}
