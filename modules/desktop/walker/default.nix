{
  flake.modules.homeManager.walker =
    { inputs, pkgs, ... }:

    {
      imports = [
        inputs.walker.homeManagerModules.default
      ];

      programs.elephant = {
        enable = true;
        providers = [
          "desktopapplications"
          "runner"
          "clipboard"
          "websearch"
          "files"
          "providerlist"
          "windows"
          "symbols"
          "calc"
        ];
      };

      programs.walker = {
        enable = true;
        runAsService = true;

        config = {
          activation.close_when_open = true;
          theme = "catppuccin";
          ui = {
            width = 600;
            hide_when_single_result = false;
            centered = true;
          };
        };

        themes.catppuccin.style = ''
          #window {
            background: rgba(30, 30, 46, 0.92);
            border: 1px solid rgba(49, 50, 68, 0.8);
            border-radius: 16px;
          }

          #search {
            background: transparent;
            color: #cdd6f4;
            font-family: "Maple Mono NF";
            font-size: 16px;
            padding: 14px 18px;
            border-bottom: 1px solid rgba(49, 50, 68, 0.5);
          }

          #search:focus { outline: none; }

          #results {
            background: transparent;
            padding: 6px;
          }

          .result {
            background: transparent;
            color: #cdd6f4;
            border-radius: 10px;
            padding: 8px 12px;
          }

          .result:selected,
          .result:hover {
            background: rgba(137, 180, 250, 0.15);
            color: #89b4fa;
          }

          .result .name {
            font-family: "Maple Mono NF";
            font-size: 14px;
          }

          .result .desc {
            font-size: 12px;
            color: #6c7086;
          }
        '';
      };
    };
}
