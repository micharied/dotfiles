{ config, pkgs, lib, ... }:

{
  imports = [ ../programs/git.nix ];

  config = {
    programs.java = {
      enable = true;
      package = pkgs.openjdk;
    };

    programs.bash.enable = true;
    programs.fish.enable = true;
    programs.fish.shellAbbrs = {
      "gaa" = "git add -A";
      "gs" = "git status -s -b";
      "gcm" = "git commit -m";
      "grsh" = "git reset --hard";
      "gam" = "git add . && git commit -m";
      "gp" = "git push";
      "gpu" = "git push --set-upstream";
      "gpuo" = "git push --set-upstream origin";
      "gf" = "git pull";
      "gF" = "git fetch";
      "gca" = "git commit --amend";
      "gash" = "git stash";
      "gpop" = "git stash pop";
      "gl" = "git log --oneline --graph --all --decorate";
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = false;
    };

    # Cross-platform packages; Linux-only extras stay in home/linux.nix.
    home.packages = with pkgs; [
      vscode
      cachix
      rsync
      thunderbird
      signal-desktop-bin
      firefox
      discord
      docker
      docker-compose
      postman
      keepassxc
      zoom-us
      nodejs
      mcp-nixos
    ];

    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
  };
}
