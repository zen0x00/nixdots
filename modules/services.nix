{ ... }:

{

  services.usbmuxd.enable = true;

  services.dbus.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.tuned.enable = true;

  services.upower.enable = true;

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };
}
