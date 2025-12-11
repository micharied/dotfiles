{ config, pkgs, lib, ... }:

{
  imports = [ ../programs/git.nix ];

  config = {
    programs.java = {
      enable = true;
      package = pkgs.openjdk;
    };

    programs.bash.enable = true;
    programs.bash.bashrcExtra =
      "\n    # Enable direnv\n    eval \"$(direnv hook bash)\"\n    ";

    programs.bash.shellAliases = {
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
      runhspec =
        ''runhspec() { cabal test --test-options="--match=$1"; }; runhspec'';
    };

    programs.direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = false;
    };

    # Cross-platform packages; Linux-only extras stay in home/linux.nix.
    home.packages = with pkgs; [
      vscode
      mattermost-desktop
      thunderbird
      nextcloud-client
      android-studio
      signal-desktop
      remnote
      discord
      docker
      docker-compose
      postman
      gimp3
      keepassxc
      zoom-us
      readest
    ];

    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
  };
}
