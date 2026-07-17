{
  flake.modules.nixos.services =
    { ... }:

    {
      services.usbmuxd.enable = true;

      services.dbus.enable = true;

      services.gnome.gnome-keyring.enable = true;

      services.tuned.enable = true;

      services.upower.enable = true;
    }
;
}
