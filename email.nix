{ config, ... }:

{
  active-group.ldap = {
    userName = "riedlinger";
    fullName = "Micha Riedlinger";
    email = "micha.riedlinger@active-group.de";
    phoneNumber = null;
  };

  active-group.thunderbird = {
    enable = true;
    calendars = {
      enableAGCalendars = true;
      micha = {
        readOnly = false;
        suppressAlarms = false;
        color = "#ff2968";
      };
      geburtstage.color = "#0000ff";
      regeltermine.color = "#0000ff";

      bianca-schulungen.enable = false;
      felix-schulungen.enable = false;
      marco-schulungen.enable = false;
      marcus-schulungen.enable = false;
      markus-schulungen.enable = false;
      pr.enable = false;
    };
  };

  accounts.email.accounts.gmailmicha = {
    userName = "micha.riedlinger@gmail.com";
    address = "micha.riedlinger@gmail.com";
    realName = config.active-group.ldap.fullName;
    imap = {
      host = "imap.gmail.com";
      port = 993;
    };
    smtp = {
      host = "smtp.gmail.com";
      port = 465;
    };
    thunderbird.enable = true;
  };

  accounts.email.accounts.allinklMicha = {
    userName = "kontakt@micha-riedlinger.de";
    address = "kontakt@micha-riedlinger.de";
    realName = config.active-group.ldap.fullName;
    imap = {
      host = "w0146207.kasserver.com";
      port = 993;
    };
    smtp = {
      host = "w0146207.kasserver.com";
      port = 465;
    };
    thunderbird.enable = true;
  };

  accounts.email.accounts.uni = {
    userName = "zxocn63";
    address = "micha.riedlinger@student.uni-tuebingen.de";
    realName = config.active-group.ldap.fullName;
    imap = {
      host = "mailserv.uni-tuebingen.de";
      port = 993;
    };
    smtp = {
      host = "mailserv.uni-tuebingen.de";
      port = 465;
    };
    thunderbird.enable = true;
  };
}
