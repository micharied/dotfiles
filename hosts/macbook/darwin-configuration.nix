{ config, pkgs, ... }:

{
  # Core Nix/Darwin plumbing
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Shell/users
  programs.zsh.enable = true;
  users.users.micha = {
    home = "/Users/micha";
    shell = pkgs.zsh;
  };

  # Optional macOS niceties
  security.pam.enableSudoTouchIdAuth = true;

  # Keep darwin system state value pinned when upgrading
  system.stateVersion = 5;
}
