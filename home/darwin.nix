{ config, pkgs, lib, ... }:

{
  config = {
    # Add macOS-specific packages here. Keep empty for now to avoid pulling
    # Linux-only derivations onto Darwin builds.
    home.packages = with pkgs; [ ];
  };
}
