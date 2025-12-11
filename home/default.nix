{ pkgs, lib, ... }:

let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in
{
  imports =
    [ ./common.nix ]
    ++ lib.optionals isLinux [ ./linux.nix ]
    ++ lib.optionals isDarwin [ ./darwin.nix ];

  home.username = "micha";
  home.homeDirectory = lib.mkDefault (if isDarwin then "/Users/micha" else "/home/micha");
}
