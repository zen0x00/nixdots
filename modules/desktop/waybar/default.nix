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
            modules-center = [ "hyprland/window" ];
            modules-right = [
              "group/tray-expander"
              "pulseaudio"
              "network"
              "bluetooth"
              "clock"
            ];

            "hyprland/workspaces" = {
              format = "{icon}";
              format-icons = {
                active = "󰮯";
                urgent = "*";
                default = "*";
              };
              persistent-workspaces."*" = [
                1
                2
                3
                4
                5
              ];
              active-only = false;
              all-outputs = true;
              on-click = "activate";
              on-scroll-up = "hyprctl dispatch workspace e+1";
              on-scroll-down = "hyprctl dispatch workspace e-1";
            };

            "hyprland/window" = {
              format = "{title}";
              max-length = 60;
              separate-outputs = true;
              rewrite."" = "Desktop";
            };

            clock = {
              format = "{:%I:%M %p}";
              format-alt = "{:%A, %B %d}";
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

            "group/tray-expander" = {
              orientation = "inherit";
              drawer = {
                transition-duration = 600;
                children-class = "tray-group-item";
              };
              modules = [
                "custom/expand-icon"
                "tray"
              ];
            };

            "custom/expand-icon" = {
              format = "";
              tooltip = false;
            };

            pulseaudio = {
              format = "{icon}";
              on-click = "zen0x-launch-audio";
              on-click-right = "zen0x-toggle-mute";
              tooltip-format = "Volume: {volume}%";
              scroll-step = 5;
              on-scroll-up = "swayosd-client --output-volume raise";
              on-scroll-down = "swayosd-client --output-volume lower";
              format-muted = "";
              format-icons = {
                headphone = "";
                headset = "";
                default = [
                  ""
                  ""
                  ""
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
              format-wifi = "{icon}";
              format-ethernet = "󰀂";
              format-disconnected = "󰤮";
              tooltip-format-wifi = "{essid} ({frequency} GHz)";
              tooltip-format-ethernet = "Connected";
              tooltip-format-disconnected = "Disconnected";
              interval = 3;
              on-click = "zen0x-launch-wifi";
            };

            bluetooth = {
              format = "󰂯";
              format-disabled = "󰂲";
              format-off = "󰂲";
              format-connected = "󰂱";
              tooltip-format = "{status}";
              tooltip-format-connected = "{device_alias}";
              on-click = "zen0x-launch-bluetooth";
            };
          }
        ];

        style = ''
          @import "colors.css";

          * {
            font-family: "Maple Mono NF", "Symbols Nerd Font Mono";
            font-size: 13px;
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
          .modules-right { padding-right: 8px; }

          #workspaces { padding: 0 5px; }

          #workspaces button {
            padding: 0;
            margin: 0 2px;
            min-width: 16px;
            min-height: 26px;
            border-radius: 999px;
            color: alpha(@fg, 0.55);
            background: transparent;
            border: 0;
            font-size: 18px;
            font-weight: 700;
            transition: min-width 180ms ease, color 180ms ease;
          }

          #workspaces button.active {
            min-width: 24px;
            color: @accent;
            background: transparent;
          }

          #workspaces button.occupied:not(.active) {
            color: @fg;
          }

          #workspaces button.urgent {
            color: @danger;
          }

          #window {
            color: @fg;
            font-size: 13px;
            font-weight: 600;
            padding: 0 8px;
          }

          #pulseaudio,
          #network,
          #bluetooth {
            color: @fg;
            font-size: 12px;
            padding: 0 8px;
            border-radius: 14px;
          }

          #clock {
            color: @fg;
            font-size: 12px;
            font-weight: 700;
            padding: 0 8px;
            border-radius: 14px;
          }

          #tray-expander { padding: 0 4px; }
          #tray { padding: 0 8px; }

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
