{
  flake.modules.homeManager.scripts =
    {
      pkgs,
      lib,
      ...
    }:

    let
      scriptDir = ./.;
      scriptNames = [
        "zen0x-audio-output-switch"
        "zen0x-brightness-display"
        "zen0x-capture-screenrecording"
        "zen0x-capture-screenshot"
        "zen0x-launch-audio"
        "zen0x-launch-bluetooth"
        "zen0x-launch-or-focus"
        "zen0x-launch-or-focus-tui"
        "zen0x-launch-tui"
        "zen0x-launch-wifi"
        "zen0x-powermenu"
        "zen0x-theme-reload"
        "zen0x-toggle-bluetooth"
        "zen0x-toggle-mute"
        "zen0x-toggle-wifi"
      ];

      makeScript =
        name:
        pkgs.writeShellScriptBin name (builtins.readFile "${scriptDir}/${name}");

      scripts = map makeScript scriptNames;
    in
    {
      home.packages =
        scripts
        ++ (with pkgs; [
          grim
          slurp
          satty
          wf-recorder
          brightnessctl
          playerctl
          wiremix
          bluetui
          impala
          rofi-wayland
          swayosd
          mako
          walker
          jq
          python3
        ]);
    };
}
