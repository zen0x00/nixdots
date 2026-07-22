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
        ${python}/bin/python3 ${themeDir}/generate-theme.py catppuccin
      '';

      home.packages = [
        (pkgs.writeShellScriptBin "zen0x-generate-theme" ''
          exec ${python}/bin/python3 ${themeDir}/generate-theme.py "$@"
        '')

        (pkgs.writeShellScriptBin "zen0x-apply-theme" ''
          set -euo pipefail
          if [ "$#" -ne 1 ]; then
            echo "Usage: zen0x-apply-theme <theme>" >&2
            echo "Available themes:" >&2
            ls ${themeDir}/palettes/ | sed 's/\.toml$//' | sort >&2
            exit 2
          fi
          THEME="$1"
          zen0x-generate-theme "$THEME"
          mkdir -p "$HOME/.config/zen0x"
          printf '%s\n' "$THEME" > "$HOME/.config/zen0x/current-theme"
          zen0x-theme-reload
        '')

        (pkgs.writeShellScriptBin "zen0x-theme-menu" ''
          set -euo pipefail
          current=$(cat "$HOME/.config/zen0x/current-theme" 2>/dev/null || true)
          selected=$(ls ${themeDir}/palettes/ | sed 's/\.toml$//' | sort | while IFS= read -r theme; do
            if [ "$theme" = "$current" ]; then
              echo "✓  $theme"
            else
              echo "   $theme"
            fi
          done | rofi -dmenu -p "Theme")
          [ -z "$selected" ] && exit 0
          selected="$(printf '%s' "$selected" | sed 's/^[[:space:]✓]*//')"
          zen0x-apply-theme "$selected"
        '')
      ];
    };
}
