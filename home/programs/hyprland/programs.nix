{
  xdg.configFile."hypr/programs.lua".text = ''
    return {
      terminal = "kitty",
      file_manager = "nautilus",
      browser = "zen",
      menu = "noctalia msg panel-toggle launcher",
      cc = "noctalia msg panel-toggle control-center",
    }
  '';
}
