{
  flake.modules.homeManager.niri =
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
        lib.concatMapStringsSep "\n" builtins.readFile fragments;

      # DMS writes these at runtime (dynamic theming); must exist and be writable
      home.activation.niriDmsFragments = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p "$HOME/.config/niri/dms"
        for f in outputs colors layout alttab binds cursor windowrules; do
          [ -e "$HOME/.config/niri/dms/$f.kdl" ] || touch "$HOME/.config/niri/dms/$f.kdl"
        done
      '';
    }
;
}
