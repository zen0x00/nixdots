{
  flake.modules.homeManager.hyprland =
    {
      xdg.configFile."hypr/monitors.lua".text = ''
        local function hdmi_connected()
          for _, path in ipairs({
            "/sys/class/drm/card0/card0-HDMI-A-1/status",
            "/sys/class/drm/card1/card1-HDMI-A-1/status",
          }) do
            local f = io.open(path, "r")
            if f then
              local status = f:read("*l")
              f:close()
              if status == "connected" then
                return true
              end
            end
          end
          return false
        end

        if hdmi_connected() then
          hl.monitor({ output = "eDP-1", disabled = true })
          hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@180", position = "0x0", scale = "1", })
        else
          hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x0", scale = "1", })
        end
      '';
    }
;
}
