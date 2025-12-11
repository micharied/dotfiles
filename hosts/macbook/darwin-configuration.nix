{ config, pkgs, ... }:

{
  # Core Nix/Darwin plumbing (daemon is managed automatically by nix-darwin)
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Shell/users
  programs.zsh.enable = true;
  users.users.micha = {
    home = "/Users/micha";
    shell = pkgs.zsh;
  };

  # Optional macOS niceties
  security.pam.services.sudo_local.touchIdAuth = true;

  # Keep darwin system state value pinned when upgrading
  system.stateVersion = 5;
}
