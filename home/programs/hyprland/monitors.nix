{
  home.file.".config/hypr/monitors.lua".text = ''
    local probe = io.popen("ls /sys/class/drm")
    local hdmi_connected = false

    if probe then
      local output = probe:read("*a")
      probe:close()
      hdmi_connected = output:match("HDMI") ~= nil
    end

    if hdmi_connected then
      hl.monitor({ output = "eDP-1", disabled = true })
      hl.monitor({
        output = "HDMI-A-1",
        mode = "1920x1080@180",
        position = "0x0",
        scale = "1",
      })
    else
      hl.monitor({
        output = "eDP-1",
        mode = "1920x1080@144",
        position = "0x0",
        scale = "1",
      })
    end
  '';
}
