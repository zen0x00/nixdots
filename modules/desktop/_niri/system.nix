{
  flake.modules.nixos.niri =
    { pkgs, ... }:

    {
      programs.niri.enable = true;

      # niri auto-spawns this for X11 apps (steam, games) when on PATH
      environment.systemPackages = [ pkgs.xwayland-satellite ];

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };
    }
;
}
