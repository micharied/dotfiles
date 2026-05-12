{ config, pkgs, lib, ... }:

{
  home.username = "micha";
  home.homeDirectory = "/Users/micha";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.openjdk;
  };

  programs.bash.enable = true;
  programs.fish.enable = true;
  programs.fish.shellInit = ''
    fish_add_path --prepend --global /etc/profiles/per-user/$USER/bin ~/.nix-profile/bin /nix/var/nix/profiles/default/bin
  '';
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
    package = pkgs.direnv.overrideAttrs (old: { doCheck = false; });
  };

  programs.git = {
    enable = true;
    includes = [{
      condition = "gitdir:~/dev/ag/";
      contents = { user.email = "micha.riedlinger@active-group.de"; };
    }];
    ignores = [
      ".envrc"
      ".direnv/"
      ".calva"
      ".claude/"
      ".scratch/"
      "docs/agents/"
    ];
    settings = {
      user.email = "kontakt@micha-riedlinger.de";
      user.name = "Micha Riedlinger";
      init.defaultBranch = "main";
      checkout.defaultRemote = "origin";
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };

  home.packages = with pkgs; [
    vscode
    claude-code
    glab
    khard
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
}
