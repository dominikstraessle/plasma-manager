{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.akonadi;
in {
  options.programs.plasma.akonadi = {
    enable = mkEnableOption ''
      Enable akonadi
    '';
    package = mkOption {
      default = if (pkgs ? akonadi) then
                        pkgs.akonadi
                      else
                        (if pkgs.libsForQt5 ? akonadi then pkgs.libsForQt5.akonadi else false);
      defaultText = literalExpression "pkgs.akonadi";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "Alarm" = with types; mkOption {
      type = submodule {
        options = { 
          AlarmDays = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          EnableAlarm = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Alarm";
    };    
    "Compacting" = with types; mkOption {
      type = submodule {
        options = { 
          CompactFrequency = mkOption {
            type = nullOr (either str (enum [ 
              "never"
              "per_x_messages"
            ]));
            default = "per_x_messages";
            description = ''
              

              Type: Enum
              Choices: 
                - never
                - per_x_messages
            '';
          };
          MessageCount = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              Number of deleted messages before a purge is started.

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Compacting";
    };    
    "ConfigurationDialogRestrictions" = with types; mkOption {
      type = submodule {
        options = { 
          MinimumCheckInterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ConfigurationDialogRestrictions";
    };    
    "Filter" = with types; mkOption {
      type = submodule {
        options = { 
          FilterCategories = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          FilterOnCategories = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Filter";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          Account = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          AccountId = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              The account id in WebAccounts framework.

              Type: UInt
            '';
          };
          AccountName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          AccountServices = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Account enabled services

              Type: StringList
            '';
          };
          AuthMode = mkOption {
            type = nullOr str;
            default = "username-password";
            description = ''
              

              Type: String
            '';
          };
          AutoDiscovery = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              Server Autodiscovery

              Type: Bool
            '';
          };
          AutosaveInterval = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Autosave interval time (in minutes).

              Type: UInt
            '';
          };
          BasePath = mkOption {
            type = nullOr str;
            default = "$HOME/.local/share/akonadi_etesync_resource";
            description = ''
              Path to base directory

              Type: Path
            '';
          };
          BaseUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Server URL

              Type: String
            '';
          };
          Calendars = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              IDs of calendars in collection

              Type: StringList
            '';
          };
          ConflictHandling = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The way how conflicts should be handled

              Type: String
            '';
          };
          DataFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to the Knut data file.

              Type: Path
            '';
          };
          DisplayName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Display name.

              Type: String
            '';
          };
          Domain = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Domain

              Type: String
            '';
          };
          Email = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              E-mail

              Type: String
            '';
          };
          EnableIntervalCheck = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "EnableNTLMv2" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable NTLMv2 authentication

              Type: Bool
            '';
          };
          EventSubscriptionId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          EventSubscriptionWatermark = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          EventsSince = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          EwsResource = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Ews Resource

              Type: String
            '';
          };
          FileWatchingEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FolderSyncState = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          FoldersLastSync = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          HasDomain = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use a domain name during authentication

              Type: Bool
            '';
          };
          IntervalCheckTime = mkOption {
            type = nullOr (either str int);
            default = 60;
            description = ''
              

              Type: Int
            '';
          };
          IsConfigured = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          MonitorFile = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Monitor file for changes.

              Type: Bool
            '';
          };
          MonitorFilesystem = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "OAuth2AppId" = mkOption {
            type = nullOr str;
            default = "452b289a-7894-41d7-9cd4-d5275739fa27";
            description = ''
              OAuth2 application identifier

              Type: String
            '';
          };
          "OAuth2ReturnUri" = mkOption {
            type = nullOr str;
            default = "urn:ietf:wg:oauth:2.0:oob";
            description = ''
              OAuth2 return URI

              Type: String
            '';
          };
          ObjectsLastSync = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          PKeyCert = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to PKey authentication PEM certificate

              Type: String
            '';
          };
          PKeyKey = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Path to PKey authentication PEM private key

              Type: String
            '';
          };
          Password = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Password

              Type: Password
            '';
          };
          Path = mkOption {
            type = nullOr str;
            default = "$HOME/.local/share/contacts/";
            description = ''
              Path to contacts directory

              Type: Path
            '';
          };
          PollInterval = mkOption {
            type = nullOr (either str float);
            default = "";
            description = ''
              Poll Interval

              Type: Double
            '';
          };
          ReadOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not change the actual backend data.

              Type: Bool
            '';
          };
          RetrievalMethod = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              Retrieval

              Type: Int
            '';
          };
          ServerSubscription = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              Enable Server-Side Subscriptions

              Type: Bool
            '';
          };
          ServerSubscriptionList = mkOption {
            type = nullOr (either str (listOf str));
            default = "default";
            description = ''
              List of folders to subscribe to

              Type: StringList
            '';
          };
          ServerURL = mkOption {
            type = nullOr str;
            default = "http://localhost/owncloud/index.php/apps/grauphel";
            description = ''
              The URL to the Tomboy sync server

              Type: String
            '';
          };
          TaskLists = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              IDs of task lists in collection

              Type: StringList
            '';
          };
          TopLevelIsContainer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Path points to a folder containing Maildirs instead of to a maildir itself.

              Type: Bool
            '';
          };
          UseIncrementalUpdates = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use incremental updates

              Type: Bool
            '';
          };
          UserAgent = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Forces a non-default User-Agent string

              Type: String
            '';
          };
          Username = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Username

              Type: String
            '';
          };
          authenticationMethod = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              Defines the authentication type to use

              Type: Int
            '';
          };
          collectionName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The display name of this resource

              Type: String
            '';
          };
          collectionsUrlsMappings = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              String representation of the mappings between discovered collections and configured URLs

              Type: String
            '';
          };
          contentURL = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The URL to the notes on the Tomboy sync server

              Type: String
            '';
          };
          defaultUsername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              User name

              Type: String
            '';
          };
          displayName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Display name

              Type: String
            '';
          };
          filterCheckSize = mkOption {
            type = nullOr (either str int);
            default = 50000;
            description = ''
              

              Type: UInt
            '';
          };
          filterOnServer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          host = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ignoreSslErrors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Ignore SSL errors.

              Type: Bool
            '';
          };
          intervalCheckEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          intervalCheckInterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
            '';
          };
          leaveOnServer = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          leaveOnServerCount = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          leaveOnServerDays = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          leaveOnServerSize = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          limitSyncRange = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Limit the events retrieval to the specified time range

              Type: Bool
            '';
          };
          login = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          name = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          pipelining = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          port = mkOption {
            type = nullOr (either str int);
            default = 110;
            description = ''
              

              Type: UInt
            '';
          };
          precommand = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          readOnly = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Do not change the actual backend data.

              Type: Bool
            '';
          };
          refreshInterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Refresh every

              Type: Int
            '';
          };
          remoteUrls = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Remote URLs

              Type: StringList
            '';
          };
          requestToken = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The request token to the Tomboy sync server

              Type: String
            '';
          };
          requestTokenSecret = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The request token secret to the Tomboy sync server

              Type: String
            '';
          };
          settingsVersion = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Settings Version

              Type: Int
            '';
          };
          syncRangeStartNumber = mkOption {
            type = nullOr str;
            default = "3";
            description = ''
              Period for which to retrieve events, quantity

              Type: String
            '';
          };
          syncRangeStartType = mkOption {
            type = nullOr str;
            default = "M";
            description = ''
              Period for which to retrieve events, type

              Type: String
            '';
          };
          targetCollection = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          unitTestPassword = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          useProxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          useSSL = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          useTLS = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          userURL = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The URL to the user data on the Tomboy sync server

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "LeaveOnServer" = with types; mkOption {
      type = submodule {
        options = { 
          downloadLater = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          seenUidList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          seenUidTimeList = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
        };
      };
      default = {};
      description = "LeaveOnServer";
    };    
    "Locking" = with types; mkOption {
      type = submodule {
        options = { 
          Lockfile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Lockfile

              Type: String
            '';
          };
          LockfileMethod = mkOption {
            type = nullOr (either str (enum [ 
              "procmail"
              "mutt_dotlock"
              "mutt_dotlock_privileged"
              "none"
            ]));
            default = "none";
            description = ''
              

              Type: Enum
              Choices: 
                - procmail
                - mutt_dotlock
                - mutt_dotlock_privileged
                - none
            '';
          };
        };
      };
      default = {};
      description = "Locking";
    };    
    "SpecialCollections" = with types; mkOption {
      type = submodule {
        options = { 
          DefaultResourceId = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Id of the resource containing the default special collections.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "SpecialCollections";
    };    
    "cache" = with types; mkOption {
      type = submodule {
        options = { 
          AccountIdentity = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              Identity account

              Type: Int
            '';
          };
          AutomaticExpungeEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Defines if the expunge command is issued automatically, otherwise it should be
             triggered manually through the D-Bus interface.

              Type: Bool
            '';
          };
          DisconnectedModeEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Defines if all the IMAP data should be cached locally all the time

              Type: Bool
            '';
          };
          IntervalCheckEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Defines if interval checking is enabled.

              Type: Bool
            '';
          };
          IntervalCheckTime = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Check interval in minutes

              Type: Int
            '';
          };
          KnownMailBoxes = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of mailbox names reported by the server the last time

              Type: StringList
            '';
          };
          RetrieveMetadataOnFolderListing = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Defines if the annotations, ACLs and quota information of mailboxes should
             also be retrieved when the mailboxes get listed.

              Type: Bool
            '';
          };
          TrashCollection = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Define which folder is used for trash

              Type: Int
            '';
          };
          TrashCollectionMigrated = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Define if the trash collection received the special attribute

              Type: Bool
            '';
          };
          UseDefaultIdentity = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Define if account uses the default identity

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "cache";
    };    
    "idle" = with types; mkOption {
      type = submodule {
        options = { 
          IdleRidPath = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              RID path to the mailbox to watch for changes

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "idle";
    };    
    "network" = with types; mkOption {
      type = submodule {
        options = { 
          Authentication = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Defines the authentication type to use

              Type: Int
            '';
          };
          ImapPort = mkOption {
            type = nullOr (either str int);
            default = 993;
            description = ''
              Defines the port the IMAP service is running on

              Type: Int
            '';
          };
          ImapServer = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              IMAP server

              Type: String
            '';
          };
          OverrideEncryption = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Override configured encryption mode

              Type: String
            '';
          };
          Safety = mkOption {
            type = nullOr str;
            default = "SSL";
            description = ''
              Defines the encryption type to use

              Type: String
            '';
          };
          SessionTimeout = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              

              Type: Int
            '';
          };
          SubscriptionEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Defines if the server side subscription is enabled

              Type: Bool
            '';
          };
          UseProxy = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Connect using the system proxy settings

              Type: Bool
            '';
          };
          UserName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Username

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "network";
    };    
    "reminders" = with types; mkOption {
      type = submodule {
        options = { 
          AttendingReminders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          BirthdayReminderDays = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          BirthdayReminders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          EventReminderHours = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          MaybeAttendingReminders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          NotAttendingReminders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          NotRespondedToReminders = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "reminders";
    };    
    "siever" = with types; mkOption {
      type = submodule {
        options = { 
          AlternateAuthentication = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Defines the authentication type to use for alternate server

              Type: Int
            '';
          };
          SieveAlternateUrl = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Define alternate URL

              Type: String
            '';
          };
          SieveCustomAuthentification = mkOption {
            type = nullOr str;
            default = "ImapUserPassword";
            description = ''
              Defines the type of identification used by custom sieve server

              Type: String
            '';
          };
          SieveCustomUsername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Define username used from custom server sieve url

              Type: String
            '';
          };
          SievePort = mkOption {
            type = nullOr (either str int);
            default = 4190;
            description = ''
              Define sieve port

              Type: Int
            '';
          };
          SieveReuseConfig = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Define if we reuse host and login configuration

              Type: Bool
            '';
          };
          SieveSupport = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Define if server supports sieve

              Type: Bool
            '';
          };
          SieveVacationFilename = mkOption {
            type = nullOr str;
            default = "kmail-vacation.siv";
            description = ''
              Define default sieve vacation filename

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "siever";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf (moduleCfg.package != false) [ moduleCfg.package ];
    programs.plasma.files."akonadirc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
