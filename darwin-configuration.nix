{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;
  users.users.micha = {
    home = "/Users/micha";
    shell = pkgs.zsh;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system.activationScripts.resignFish = {
    text = ''
      fish_bin="${pkgs.fish}/bin/fish"
      if [ -f "$fish_bin" ]; then
        /usr/bin/codesign --sign - --force --preserve-metadata=entitlements,requirements,flags,runtime "$fish_bin" 2>/dev/null || true
      fi
    '';
  };

  system.stateVersion = 5;
}
