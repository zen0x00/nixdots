{
  flake.modules.homeManager.waybar =
    { pkgs, ... }:

    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = [
          {
            layer = "top";
            position = "top";
            height = 42;
            spacing = 0;
            margin-top = 8;
            margin-left = 12;
            margin-right = 12;
            exclusive = true;
            passthrough = false;
            gtk-layer-shell = true;

            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "clock" ];
            modules-right = [
              "tray"
              "network"
              "bluetooth"
              "pulseaudio"
              "battery"
              "custom/power"
            ];

            "hyprland/workspaces" = {
              on-click = "activate";
              format = "{icon}";
              format-icons = {
                default = "";
                "1" = "1";
                "2" = "2";
                "3" = "3";
                "4" = "4";
                "5" = "5";
                "6" = "6";
                "7" = "7";
                "8" = "8";
                "9" = "9";
                "10" = "0";
                active = "󱓻";
              };
              persistent-workspaces = {
                "1" = [];
                "2" = [];
                "3" = [];
                "4" = [];
                "5" = [];
              };
            };

            clock = {
              format = "{:%I:%M %p  ·  %a, %b %d}";
              tooltip-format = "<tt>{calendar}</tt>";
              calendar = {
                mode = "month";
                format = {
                  months = "<b>{}</b>";
                  today = "<b><u>{}</u></b>";
                };
              };
            };

            tray = {
              icon-size = 15;
              spacing = 6;
              show-passive-items = false;
            };

            pulseaudio = {
              format = "{icon}";
              on-click = "zen0x-launch-audio";
              on-click-right = "zen0x-toggle-mute";
              tooltip-format = "Volume: {volume}%";
              scroll-step = 5;
              on-scroll-up = "swayosd-client --output-volume raise";
              on-scroll-down = "swayosd-client --output-volume lower";
              format-muted = "󰝟";
              format-icons = {
                headphone = "󰋋";
                headset = "󰋎";
                default = [
                  "󰕿"
                  "󰖀"
                  "󰕾"
                ];
              };
            };

            network = {
              format-icons = [
                "󰤯"
                "󰤟"
                "󰤢"
                "󰤥"
                "󰤨"
              ];
              format = "{icon}";
              format-wifi = "{icon} {essid}";
              format-ethernet = "󰀂";
              format-disconnected = "󰤮";
              tooltip-format-wifi = "{essid} ({frequency} GHz)";
              tooltip-format-ethernet = "Connected";
              tooltip-format-disconnected = "Disconnected";
              interval = 3;
              on-click = "zen0x-launch-wifi";
            };

            battery = {
              format = "{icon}";
              format-charging = "󰂄";
              format-plugged = "󰚥";
              format-full = "󰁹";
              format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
              tooltip-format = "{capacity}% · {timeTo}";
              states = {
                warning = 30;
                critical = 15;
              };
            };

            "custom/power" = {
              format = "󰐥";
              tooltip = false;
              on-click = "zen0x-powermenu";
            };

            bluetooth = {
              format = "󰂯";
              format-disabled = "󰂲";
              format-off = "󰂲";
              format-connected = "󰂱 {device_alias}";
              tooltip-format = "{status}";
              tooltip-format-connected = "{device_alias}";
              on-click = "zen0x-launch-bluetooth";
            };
          }
        ];

        style = ''
          @import "colors.css";

          @define-color window_bg_color #1e1e2e;

          * {
            font-family: "JetBrainsMono Nerd Font Propo", "Symbols Nerd Font Mono";
            font-size: 14px;
            font-weight: 600;
            border: none;
            border-radius: 0;
            min-height: 0;
            padding: 0;
            margin: 0;
            box-shadow: none;
          }

          window#waybar {
            background: alpha(@panelAlt, 0.88);
            border: 1px solid alpha(@accent, 0.45);
            border-radius: 14px;
            color: @fg;
          }

          .modules-left { padding-left: 10px; }
          .modules-right {
            padding-right: 10px;
          }

          #workspaces button {
            all: initial;
            color: @fg;
            font-family: "JetBrainsMono Nerd Font Propo", "Symbols Nerd Font Mono";
            font-size: 16px;
            padding: 0 6px;
            margin: 0 1.5px;
            min-width: 9px;
          }

          #workspaces button.empty {
            opacity: 0.5;
          }

          #pulseaudio,
          #network,
          #bluetooth,
          #battery,
          #custom-power,
          #tray {
            font-size: 16px;
            padding: 0 10px;
            margin: 0 3px;
          }

          #pulseaudio,
          #network,
          #bluetooth,
          #battery {
            color: @fg;
          }

          #clock {
            color: @fg;
            font-size: 16px;
            font-weight: 700;
            padding: 0 8px;
          }

          #battery.warning { color: @warning; }
          #battery.critical { color: @danger; }
          #battery.charging { color: @success; }

          #custom-power {
            color: @danger;
          }

          #custom-power:hover {
            color: @fg;
          }

          #tray > .passive { -gtk-icon-effect: dim; }
          #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background: alpha(@danger, 0.12);
            border-radius: 6px;
          }
        '';
      };
    };
}
