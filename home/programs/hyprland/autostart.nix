{
  xdg.configFile."hypr/autostart.lua".text = ''
    hl.on("hyprland.start", function()
        hl.exec_cmd("uwsm app -- noctalia")
        hl.exec_cmd("/run/current-system/sw/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
        hl.exec_cmd("wl-paste --type text --watch cliphist store")
        hl.exec_cmd("wl-paste --type image --watch cliphist store")
        hl.exec_cmd("hyprctl setcursor Sunset-cursors 24")
    end)
  '';
}
