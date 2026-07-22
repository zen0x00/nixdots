{
  flake.modules.homeManager.mako =
    { ... }:

    {
      services.mako = {
        enable = true;
        settings = {
          font = "Maple Mono NF 13";
          background-color = "#251428e6";
          text-color = "#f2dfc8";
          border-color = "#6b3d7a";
          progress-color = "over #f7a35c";
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
          border-color=#f2657a
          default-timeout=0

          [urgency=low]
          border-color=#4a2d55
        '';
      };
    };
}
