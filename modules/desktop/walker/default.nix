{
  flake.modules.homeManager.walker =
    { pkgs, ... }:

    {
      home.packages = [ pkgs.walker ];

      xdg.configFile."walker/config.toml".text = ''
        [activation]
        close_when_open = true

        [ui]
        width = 600
        hide_when_single_result = false
        centered = true

        [[modules]]
        name = "applications"
        placeholder = "Search apps..."

        [[modules]]
        name = "runner"
        placeholder = "Run command..."

        [[modules]]
        name = "clipboard"
        placeholder = "Search clipboard..."
      '';

      xdg.configFile."walker/themes/velvet-mango.css".text = ''
        #window {
          background: rgba(37, 20, 40, 0.92);
          border: 1px solid rgba(107, 61, 122, 0.6);
          border-radius: 16px;
        }

        #search {
          background: transparent;
          color: #f2dfc8;
          font-family: "Maple Mono NF";
          font-size: 16px;
          padding: 14px 18px;
          border-bottom: 1px solid rgba(107, 61, 122, 0.3);
        }

        #search:focus { outline: none; }

        #results {
          background: transparent;
          padding: 6px;
        }

        .result {
          background: transparent;
          color: #f2dfc8;
          border-radius: 10px;
          padding: 8px 12px;
        }

        .result:selected,
        .result:hover {
          background: rgba(247, 163, 92, 0.15);
          color: #f7a35c;
        }

        .result .name {
          font-family: "Maple Mono NF";
          font-size: 14px;
        }

        .result .desc {
          font-size: 12px;
          color: #7a5585;
        }
      '';
    };
}
