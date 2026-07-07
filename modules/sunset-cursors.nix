{ stdenvNoCC, fetchFromGitHub, pkgs }:

stdenvNoCC.mkDerivation {
  pname = "sunset-cursors";
  version = "git";

  src = fetchFromGitHub {
    owner = "yeyushengfan258";
    repo = "Sunset-Cursors";
    rev = "master";
    hash = "sha256-XtsBNs/C7aApsPSDhCLedQHu+UP9hzFSyqpCRScXxVk=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r . $out/share/icons/Sunset-Cursors
  '';
}
