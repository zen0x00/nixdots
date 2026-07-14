{ lib, ... }:

let
  fragments = [
    ./misc.kdl
    ./outputs.kdl
    ./input.kdl
    ./layout.kdl
    ./rules.kdl
    ./binds.kdl
  ];
in
{
  xdg.configFile."niri/config.kdl".text =
    lib.concatMapStringsSep "\n" builtins.readFile fragments
    + ''

      include "noctalia.kdl"
    '';
}
