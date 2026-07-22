{
  flake.modules.homeManager.mako =
    { ... }:

    {
      services.mako = {
        enable = true;
        settings = {
          font = "Maple Mono NF 13";
          background-color = "#1e1e2ee6";
          text-color = "#cdd6f4";
          border-color = "#313244";
          progress-color = "over #89b4fa";
          border-size = 1;
          border-radius = 14;
          padding = "12,16";
          width = 360;
          height = 120;
          anchor = "top-right";
          margin = "8,8,0,0";
          default-timeout = 5000;
          layer = "overlay";
          sort = "-time";
          icons = true;
          max-icon-size = 48;
        };

        # Urgency sections via extraConfig
        extraConfig = ''
          [urgency=critical]
          border-color=#f38ba8
          default-timeout=0

          [urgency=low]
          border-color=#45475a
        '';
      };
    };
}
