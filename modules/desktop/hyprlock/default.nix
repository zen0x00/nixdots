{
  flake.modules.homeManager.hyprlock =
    { ... }:

    {
      programs.hyprlock = {
        enable = true;
        # hyprlock.conf is written at activation time by the theme engine
        # from templates/hyprland/hyprlock.conf.tpl
      };
    };
}
