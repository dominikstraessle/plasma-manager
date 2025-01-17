{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akonadi-calendar;
in {
  options.programs.plasma.akonadi-calendar = {
    enable = mkEnableOption ''
      Enable akonadi-calendar
    '';
    package = mkOption {
      default = if (pkgs ? akonadi-calendar) then
                        pkgs.akonadi-calendar
                      else
                        (if pkgs.libsForQt5 ? akonadi-calendar then pkgs.libsForQt5.akonadi-calendar else false);
      defaultText = literalExpression "pkgs.akonadi-calendar";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "FreeBusy Publish" = with types; mkOption {
      type = submodule {
        options = { 
          FreeBusyPublishAuto = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FreeBusyPublishDays = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: Int
            '';
          };
          FreeBusyPublishDelay = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          FreeBusyPublishPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Publish Password

              Type: Password
            '';
          };
          FreeBusyPublishSavePassword = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FreeBusyPublishUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Publish URL

              Type: String
            '';
          };
          FreeBusyPublishUser = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Publish Username

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "FreeBusy Publish";
    };    
    "FreeBusy Retrieve" = with types; mkOption {
      type = submodule {
        options = { 
          FreeBusyFullDomainRetrieval = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use full email address for retrieval

              Type: Bool
            '';
          };
          FreeBusyRetrieveAuto = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable Automatic Free/Busy Retrieval

              Type: Bool
            '';
          };
          FreeBusyRetrievePassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Retrieval Password

              Type: Password
            '';
          };
          FreeBusyRetrieveSavePassword = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          FreeBusyRetrieveUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Retrieval URL

              Type: String
            '';
          };
          FreeBusyRetrieveUser = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Free/Busy Retrieval Username

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "FreeBusy Retrieve";
    };    
    "Group Scheduling" = with types; mkOption {
      type = submodule {
        options = { 
          Bcc = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Send copy to owner when mailing events

              Type: Bool
            '';
          };
          MailTransport = mkOption {
            type = nullOr str;
            default = "false";
            description = ''
              Mail transport to use for sending e-mail messages

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Group Scheduling";
    };    
    "Hidden Options" = with types; mkOption {
      type = submodule {
        options = { 
          FreeBusyCheckHostname = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Check whether hostname and retrieval email address match

              Type: Bool
            '';
          };
          OutlookCompatCounterProposals = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Send Outlook-like pseudo counter proposals

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Hidden Options";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."akonadi-calendarrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
