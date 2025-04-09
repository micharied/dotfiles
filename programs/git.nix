{ config, lib, pkgs, ... }: {
  config = {
    programs.git = {
      enable = true;
      userEmail = "kontakt@micha-riedlinger.de";
      userName = "Micha Riedlinger";
      includes = [{
        condition = "gitdir:~/dev/activegroup/";
        contents = { user.email = "micha.riedlinger@active-group.de"; };
      }];
      ignores = [
        ".envrc"
        ".direnv/"

        ".calva"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        checkout.defaultRemote = "origin";
        # url = {
        #   "https://github.com/" = {insteadOf = "gh:";};
        #   "git@github.com:" = {insteadOf = "gs:";};
        #   "git@github.com:haglobah/" = {insteadOf = "my:";};
        #   "https://gitlab.com/" = {insteadOf = "gl:";};
        #   "ssh://git@gitlab.active-group.de:1022/ag/" = {insteadOf = "ag:";};
        #   "git@github.com:active-group/" = {insteadOf = "agh:";};
        # };
      };
    };
  };
}
