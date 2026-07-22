{
  flake.modules.homeManager.swayosd =
    { pkgs, ... }:

    {
      home.packages = [ pkgs.swayosd ];

      systemd.user.services.swayosd = {
        Unit = {
          Description = "SwayOSD volume/brightness overlay server";
          PartOf = [ "graphical-session.target" ];
          After = [ "graphical-session.target" ];
        };
        Service = {
          ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
          Restart = "on-failure";
        };
        Install.WantedBy = [ "graphical-session.target" ];
      };
    };
}
