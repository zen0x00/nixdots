{
  flake.modules.homeManager.noctalia =
    { ... }:

    {
      xdg.configFile."noctalia/palettes/mocha.json".source = ./palettes/mocha.json;
      xdg.configFile."noctalia/palettes/glacier.json".source = ./palettes/glacier.json;

      xdg.configFile."noctalia/config.toml".text = ''
        [widget.workspaces]
        display = "name"
        hide_empty_workspaces = true
      '';
    }
;
}
