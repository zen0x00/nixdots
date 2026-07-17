{
  flake.modules.homeManager.mime =
    {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "image/png" = "org.gnome.Loupe.desktop";
          "image/jpeg" = "org.gnome.Loupe.desktop";
          "image/gif" = "org.gnome.Loupe.desktop";
          "image/webp" = "org.gnome.Loupe.desktop";
          "image/bmp" = "org.gnome.Loupe.desktop";
          "image/tiff" = "org.gnome.Loupe.desktop";
          "image/svg+xml" = "org.gnome.Loupe.desktop";

          "application/pdf" = "org.pwmt.zathura.desktop";

          "application/zip" = "org.gnome.FileRoller.desktop";
          "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
          "application/x-tar" = "org.gnome.FileRoller.desktop";
          "application/x-compressed-tar" = "org.gnome.FileRoller.desktop";
          "application/gzip" = "org.gnome.FileRoller.desktop";
          "application/x-bzip2" = "org.gnome.FileRoller.desktop";
          "application/x-rar" = "org.gnome.FileRoller.desktop";

          "inode/directory" = "org.gnome.Nautilus.desktop";
        };
      };
    }
;
}
