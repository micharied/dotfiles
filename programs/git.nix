{ config, lib, pkgs, ... }: {
  config = {
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
      ];
      settings = {
        user.email = "kontakt@micha-riedlinger.de";
        user.name = "Micha Riedlinger";
        init.defaultBranch = "main";
        checkout.defaultRemote = "origin";
      };
    };
  };
}
