{
  flake.modules.homeManager.theme =
    {
      pkgs,
      lib,
      ...
    }:

    let
      themeDir = ./.;
      python = pkgs.python3;
    in
    {
      home.activation.generateTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        ${python}/bin/python3 ${themeDir}/generate-theme.py velvet-mango
      '';
    };
}
