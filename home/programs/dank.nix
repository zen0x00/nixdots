{ inputs, ... }:

{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  programs.dank-material-shell = {
    enable = true;

    systemd.enable = true;
    systemd.restartIfChanged = true;

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
  };

  # DMS belongs to the niri session only; keep it out of hyprland+noctalia
  systemd.user.services.dms.Unit.ConditionEnvironment = "XDG_CURRENT_DESKTOP=niri";
}
