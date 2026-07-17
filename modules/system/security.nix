{
  flake.modules.nixos.security =
    { pkgs, ... }:

    {
      security.polkit.enable = true;

      environment.systemPackages = [ pkgs.polkit_gnome ];
    }
;
}
