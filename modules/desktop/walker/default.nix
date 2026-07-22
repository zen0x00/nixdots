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
          hide_action_hints = true;
          hide_quick_activation = true;
          ui = {
            width = 600;
            hide_when_single_result = false;
            centered = true;
            };
        };

        themes.catppuccin.style = ''
          @define-color window_bg_color  #1e1e2e;
          @define-color accent_bg_color  #313244;
          @define-color theme_fg_color   #cdd6f4;
          @define-color accent_color     #89b4fa;
          @define-color muted_color      #6c7086;
          @define-color error_bg_color   #f38ba8;
          @define-color error_fg_color   #1e1e2e;

          * { all: unset; }

          .box-wrapper {
            background: alpha(@window_bg_color, 0.8);
            border: 1px solid alpha(@accent_bg_color, 0.6);
            border-radius: 16px;
            padding: 12px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
          }

          .input {
            background: transparent;
            color: @theme_fg_color;
            caret-color: @accent_color;
            font-family: "Maple Mono NF";
            font-size: 16px;
            padding: 10px 14px 14px 14px;
          }

          .input placeholder {
            color: @muted_color;
          }

          .list {
            color: @theme_fg_color;
          }

          .item-box {
            border-radius: 10px;
            padding: 10px 12px;
          }

          child:selected .item-box,
          row:selected .item-box {
            background: alpha(@accent_color, 0.15);
          }

          .item-subtext {
            font-size: 12px;
            color: @muted_color;
            opacity: 1;
          }

          child:selected .item-subtext,
          row:selected .item-subtext {
            color: alpha(@accent_color, 0.7);
          }

          .keybinds {
            opacity: 0;
            padding: 0;
            margin: 0;
            min-height: 0;
            font-size: 0;
          }

          .error {
            background: @error_bg_color;
            color: @error_fg_color;
            padding: 10px;
            border-radius: 8px;
          }

          scrollbar { opacity: 0; }
        '';
      };
    };
}
