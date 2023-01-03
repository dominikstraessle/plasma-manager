{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.mailcommon = { 
    "AccountOrder" = with types; mkOption {
      type = submodule {
        options = { 
          EnableAccountOrder = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          order = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "AccountOrder";
    };    
    "FavoriteCollectionView" = with types; mkOption {
      type = submodule {
        options = { 
          FavoriteCollectionViewHeight = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          FavoriteCollectionViewMode = mkOption {
            type = nullOr (either str (enum [ 
              "HiddenMode"
              "IconMode"
              "ListMode"
            ]));
            default = "IconMode";
            description = ''
              Display Mode of the Favorite Collections View

              Type: Enum
              Choices: 
                - HiddenMode: Do not show the favorite folders view.
                - IconMode: Show favorite folders in icon mode.
                - ListMode: Show favorite folders in list mode.
            '';
          };
        };
      };
      default = {};
      description = "FavoriteCollectionView";
    };    
    "FavoriteCollectionWidget" = with types; mkOption {
      type = submodule {
        options = { 
          IconSize = mkOption {
            type = nullOr (either str int);
            default = 22;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "FavoriteCollectionWidget";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          authenticationMethod = mkOption {
            type = nullOr (either str int);
            default = 7;
            description = ''
              Defines the authentication type to use

              Type: Int
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
          login = mkOption {
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
          storePassword = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
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
  };
  config = mkIf cfg.enable {
    programs.plasma.files."mailcommonrc" = cfg.mailcommon;
  };
}
