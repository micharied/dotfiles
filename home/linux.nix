{ config, pkgs, lib, ... }:

{
  imports = [ ../dconf.nix ];

  config = {
    # set cursor size and dpi for 4k monitor
    xresources.properties = {
      "Xcursor.size" = 16;
      "Xft.dpi" = 172;
    };

    # Linux-only additions to the shared package set.
    home.packages = with pkgs; [
      libreoffice
      dconf2nix
      android-tools
      vial
      kdePackages.kwallet
      (pkgs.writeShellScriptBin "myandroidstudio" ''
        #!/usr/bin/env bash
        setxkbmap -layout us -variant colemak_dh
        adb devices
        GDK_BACKEND=x11 ${pkgs.android-studio}/bin/android-studio > /dev/null 2>&1 &
      '')
    ];
  };
}
