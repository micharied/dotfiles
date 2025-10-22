{ config, pkgs, ... }:

{

  imports = [ ./programs/git.nix ./dconf.nix ];

  config = {

    # TODO please change the username & home directory to your own
    home.username = "micha";
    home.homeDirectory = "/home/micha";

    # link the configuration file in current directory to the specified location in home directory
    # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

    # link all files in `./scripts` to `~/.config/i3/scripts`
    # home.file.".config/i3/scripts" = {
    #   source = ./scripts;
    #   recursive = true;   # link recursively
    #   executable = true;  # make all files executable
    # };

    # encode the file content in nix configuration file directly
    # home.file.".xxx".text = ''
    #     xxx
    # '';

    # set cursor size and dpi for 4k monitor
    xresources.properties = {
      "Xcursor.size" = 16;
      "Xft.dpi" = 172;
    };

    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
      # here is some command line tools I use frequently
      # feel free to add your own or remove some of them
      vscode
      mattermost-desktop
      thunderbird
      libreoffice
      dconf2nix
      nextcloud-client
      android-studio
      (pkgs.writeShellScriptBin "myandroidstudio" ''
        #!/usr/bin/env bash
        setxkbmap -layout us -variant colemak_dh
        adb devices
        GDK_BACKEND=x11 ${pkgs.android-studio}/bin/android-studio > /dev/null 2>&1 &
      '')
      signal-desktop
      remnote
      android-tools
      vial
      discord
      docker
      docker-compose
      postman
      keepassxc
    ];

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
      # Note: Bash aliases do not accept parameters. Use a shell function instead.
      runhspec =
        ''runhspec() { cabal test --test-options="--match=$1"; }; runhspec'';
    };
    
    programs.direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = false;
    };
    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "24.11";

    # Let home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
