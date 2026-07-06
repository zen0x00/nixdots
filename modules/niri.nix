{ pkgs, ... }:

let
  niriConfig = pkgs.writeText "niri-config.kdl" ''
    prefer-no-csd
    spawn-at-startup "noctalia"
    output "eDP-1" {
        mode "1920x1080@144.003"
        scale 1
        transform "normal"
        position x=0 y=0
    }

    input {
    keyboard {
	repeat-rate 35
	repeat-delay 200
        xkb {
            layout "us"
        }

        numlock
    }


    touchpad {
        tap
        natural-scroll
        accel-profile "flat"
    }

    mouse {
        natural-scroll
        accel-profile "flat"
    }


    focus-follows-mouse max-scroll-amount="0%"
}    

    window-rule {
      geometry-corner-radius 20
      clip-to-geometry true
    }

    window-rule {
      match app-id="dev.noctalia.Noctalia"
      open-floating true

      default-column-width {
        fixed 1080
      }

      default-window-height {
        fixed 920
      }
    }

    debug {
      honor-xdg-activation-with-invalid-serial
    }

    binds {
      Mod+Return { spawn-sh "kitty"; }
      Mod+B { spawn-sh "zen-browser"; }
      Mod+W repeat=false { close-window; }
      Mod+Space { spawn-sh "noctalia msg panel-toggle launcher"; }
      Mod+C { spawn-sh "noctalia msg panel-toggle control-center"; }
      Mod+Comma { spawn-sh "noctalia msg settings-toggle"; }

      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      Mod+Shift+1 { move-column-to-workspace 1; }
      Mod+Shift+2 { move-column-to-workspace 2; }
      Mod+Shift+3 { move-column-to-workspace 3; }
      Mod+Shift+4 { move-column-to-workspace 4; }
      Mod+Shift+5 { move-column-to-workspace 5; }
      Mod+Shift+6 { move-column-to-workspace 6; }
      Mod+Shift+7 { move-column-to-workspace 7; }
      Mod+Shift+8 { move-column-to-workspace 8; }
      Mod+Shift+9 { move-column-to-workspace 9; }

      Mod+Left  { focus-column-left; }
      Mod+Down  { focus-window-down; }
      Mod+Up    { focus-window-up; }
      Mod+Right { focus-column-right; }
      Mod+H     { focus-column-left; }
      Mod+J     { focus-window-down; }
      Mod+K     { focus-window-up; }
      Mod+L     { focus-column-right; }

      Mod+Ctrl+Left  { move-column-left; }
      Mod+Ctrl+Down  { move-window-down; }
      Mod+Ctrl+Up    { move-window-up; }
      Mod+Ctrl+Right { move-column-right; }
      Mod+Ctrl+H     { move-column-left; }
      Mod+Ctrl+J     { move-window-down; }
      Mod+Ctrl+K     { move-window-up; }
      Mod+Ctrl+L     { move-column-right; }

      XF86AudioRaiseVolume { spawn-sh "noctalia msg volume-up"; }
      XF86AudioLowerVolume { spawn-sh "noctalia msg volume-down"; }
      XF86AudioMute { spawn-sh "noctalia msg volume-mute"; }

      XF86MonBrightnessUp { spawn-sh "noctalia msg brightness-up"; }
      XF86MonBrightnessDown { spawn-sh "noctalia msg brightness-down"; }

      Mod+Shift+M { quit; }
    }
  '';
in
{
  system.activationScripts.niriConfig = ''
    install -Dm644 ${niriConfig} /home/aman/.config/niri/config.kdl
    chown aman:users /home/aman/.config/niri/config.kdl
  '';
}
