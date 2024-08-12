{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = "eDP-1";
        height = 36;
        width = 1908;
        margin-top = 6;
        spacing = 0;
        modules-left = [
          "hyprland/workspaces"
          "pulseaudio"
          "custom/playerctl"
          #"cava"
          "tray"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/uptime"
          "backlight"
          "disk"
          "memory"
          "temperature"
          "cpu"
          "network"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "󰖟";
            "3" = "󰅺";
            "4" = "󰎆";
            "5" = "";
            "6" = "󰂺";
            "7" = "󰊴";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        "pulseaudio" = {
          # "scroll-step": 1, // %, can be a float
          format = "{volume}% {icon}  {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "MUTED {icon} {format_source}";
          format-muted = "MUTED  {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pwvucontrol";
        };

        "custom/playerctl" = {
          format = "<span>󰎈 {icon} {}</span>";
          return-type = "json";
          max-length = 50;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          tooltip = false;
          format-icons = {
            Playing = "<span> </span>";
            Paused = "<span> </span>";
            Stopped = "<span> </span>";
          };
        };

        "cava" = {
          framerate = 60;
          autosens = 0;
          sensitivity = 10;
          bars = 28;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 22000;
          hide_on_silence = true;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = true;
          bar_delimiter = 0;
          monstercat = true;
          waves = true;
          noise_reduction = 0;
          input_delay = 2;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          actions = {
            on-click-right = "mode";
          };
        };

        "hyprland/window" = {
          max-length = 30;
          format = "{}";
        };

        "tray" = {
          # "icon-size": 21,
          spacing = 10;
        };

        "custom/uptime" = {
          format = "{} ";
          tooltip = false;
          exec = "uptime | sed -e 's/.*up \\([^,]*\\).*/\\1/' | xargs";
          interval = 5;
        };

        "backlight" = {
          format = "{}% ";
          tooltip = false;
          on-scroll-up = "brightnessctl set 5%+";
          on-scroll-down = "brightnessctl set 5%-";
          on-click = "brightnessctl set 100%";
        };

        "disk" = {
          interval = 30;
          format = "{path} - {percentage_free}% ";
          path = "/";
        };

        "memory" = {
          format = "{}% ";
        };

        "temperature" = {
          hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon5/temp1_input";
          critical-threshold = 80;
          format-critical = "!!! {temperatureC}°C {icon} !!!";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        "cpu" = {
          format = "{usage}% ";
          tooltip = true;
        };

        "network" = {
          # "interface": "wlp2*", // (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 󰈀";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "battery" = {
          interval = 15;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
          max-length = 25;
        };

        "clock" = {
          format = "{:%H:%M:%S}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{:%W}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
          interval = 1;
        };
      };
    };
    style = ''
             @define-color base   #1e1e2e;
             @define-color mantle #181825;
             @define-color crust  #11111b;

             @define-color text     #cdd6f4;

             @define-color surface0 #313244;
             @define-color surface1 #45475a;
             @define-color surface2 #585b70;

             @define-color blue      #89b4fa;
             @define-color lavender  #b4befe;
             @define-color sapphire  #74c7ec;
             @define-color sky       #89dceb;
             @define-color teal      #94e2d5;
             @define-color green     #a6e3a1;
             @define-color yellow    #f9e2af;
             @define-color peach     #fab387;
             @define-color maroon    #eba0ac;
             @define-color red       #f38ba8;
             @define-color mauve     #cba6f7;
             @define-color pink      #f5c2e7;
             @define-color flamingo  #f2cdcd;
             @define-color rosewater #f5e0dc;

             * {
        font-family: JetBrainsMono Nerd Font, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 14px;
             }

             window#waybar {
        color: @text;
        background-color: @base;
        border-radius: 14px;
        border: solid 3px @text;
             }

             window#waybar.hidden {
        opacity: 0.2;
             }

             button {
        border: none;
        border-radius: 0;
             }

             button:hover {
        color: @teal;
             }

             #workspaces button {
        padding-left: 2px;
        padding-right: 5px;
        background-color: transparent;
        color: @text;
             }

             #workspaces button:hover {
        color: @teal;
        background-color: rgba(0,0,0,0.2);
             }

             #workspaces button.urgent {
        color: @red;
             }

             #clock,
             #cpu,
             #memory,
             #disk,
             #temperature,
             #network,
             #pulseaudio,
             #custom-playerctl,
             #custom-uptime,
             #window,
             #battery,
             #workspaces,
             #cava,
      #backlight,
             #tray {
        padding: 0 12px;
             }

             .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
             }

             .modules-right > widget:first-child > #workspaces {
        margin-right: 0;
             }

             #cpu {
        color: @green;
             }

             #cava {
               color: @maroon;
             }

             #memory {
        color: @lavender;
             }

             #backlight {
        color: @flamingo;
             }

             #disk {
        color: @peach;
             }

             #network {
        color: @blue;
             }

             #network.disconnected {
        color: @red;
             }

             #pulseaudio {
        color: @yellow;
             }

             #pulseaudio.muted {
        color: @red;
             }

             #custome-media {
        color: @teal;
             }

             #clock {
        color: @text;
             }

             #window {
        color: @text;
             }

             #temperature {
        color: @flamingo;
             }


             @keyframes blink {
        to {
          color: @red;
        }
             }

             #temperature.critical {
        color: @text;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
             }


             #custom-playerctl {
        color: @teal;
             }

             #custom-uptime {
        color: @sapphire;
             }

             #battery {
        color: @text;
             }

             #battery.charging {
        color: @green;
             }

             #battery.critical:not(.charging) {
        color: @text;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
             }
    '';
  };
}
