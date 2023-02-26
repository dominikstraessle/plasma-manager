{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.plasma;
  moduleCfg = config.programs.plasma.kasts;
in {
  options.programs.plasma.kasts = {
    enable = mkEnableOption ''
      Enable kasts
    '';
    package = mkOption {
      default = if (pkgs ? kasts) then
                        pkgs.kasts
                      else
                        (if pkgs.libsForQt5 ? kasts then pkgs.libsForQt5.kasts else false);
      defaultText = literalExpression "pkgs.kasts";
      type = with types; either bool package;
      description = mdDoc "Package to use.";
    };
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          StoragePath = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Custom path to store enclosures and images

              Type: Url
            '';
          };
          adjustTimeLeft = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Adjust time left based on the current playback speed

              Type: Bool
            '';
          };
          alwaysShowFeedTitles = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always show the title of podcast feeds in subscription view

              Type: Bool
            '';
          };
          articleFontSize = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              Article font size

              Type: Int
            '';
          };
          articleFontUseSystem = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use default system font

              Type: Bool
            '';
          };
          autoDeleteOnPlayed = mkOption {
            type = nullOr (either str (enum [ 
              "Disabled"
              "Immediately"
              "OnNextStartup"
            ]));
            default = "OnNextStartup";
            description = ''
              Setting to select if or when to delete played episode

              Type: Enum
              Choices: 
                - Disabled: Disabled
                - Immediately: Immediately
                - OnNextStartup: On Next Startup
            '';
          };
          autoDownload = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically download new episodes

              Type: Bool
            '';
          };
          autoQueue = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatically add new episodes to queue

              Type: Bool
            '';
          };
          continuePlayingNextEntry = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Continue playing next episode after current one finishes

              Type: Bool
            '';
          };
          doFullUpdate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Update existing entries on feed update

              Type: Bool
            '';
          };
          markUnreadOnNewFeed = mkOption {
            type = nullOr (either str (enum [ 
              "None"
              "Custom"
              "All"
            ]));
            default = "None";
            description = ''
              How many episodes to mark as unread when adding a new feed

              Type: Enum
              Choices: 
                - None: None
                - Custom: Custom
                - All: All
            '';
          };
          markUnreadOnNewFeedCustomAmount = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Custom number of episodes to mark as unread/unplayed when adding new feed

              Type: Int
            '';
          };
          prioritizeStreaming = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show streaming button instead of download button

              Type: Bool
            '';
          };
          refreshOnStartup = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically fetch feed updates on startup

              Type: Bool
            '';
          };
          resetPositionOnPlayed = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Reset play position when episode is marked as played

              Type: Bool
            '';
          };
          toggleRemainingTime = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether the player shows remaining track time instead of total track time

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Network" = with types; mkOption {
      type = submodule {
        options = { 
          allowMeteredEpisodeDownloads = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow podcast downloads on metered connections

              Type: Bool
            '';
          };
          allowMeteredFeedUpdates = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow podcast updates on metered connections

              Type: Bool
            '';
          };
          allowMeteredImageDownloads = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow image downloads on metered connections

              Type: Bool
            '';
          };
          allowMeteredStreaming = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow streaming on metered connections

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Network";
    };    
    "Persistency" = with types; mkOption {
      type = submodule {
        options = { 
          lastOpenedPage = mkOption {
            type = nullOr str;
            default = "FeedListPage";
            description = ''
              The top-level page that was open at shutdown

              Type: String
            '';
          };
          sleepTimerUnits = mkOption {
            type = nullOr (either str (enum [ 
              "Seconds"
              "Minutes"
              "Hours"
            ]));
            default = "Minutes";
            description = ''
              The units for the sleepTimerValue

              Type: Enum
              Choices: 
                - Seconds: Seconds
                - Minutes: Minutes
                - Hours: Hours
            '';
          };
          sleepTimerValue = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              The number of seconds/minutes/hours to set the sleep timer to

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Persistency";
    };    
    "Synchronization" = with types; mkOption {
      type = submodule {
        options = { 
          syncDevice = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Device id with which to log into sync service

              Type: String
            '';
          };
          syncDeviceName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Device name (caption) with which to log into sync service

              Type: String
            '';
          };
          syncEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether or not sync is active

              Type: Bool
            '';
          };
          syncHostname = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Hostname for sync service

              Type: String
            '';
          };
          syncProvider = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Which service to sync to; see enum Sync::Provider

              Type: Int
            '';
          };
          syncUsername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Username to log into sync service

              Type: String
            '';
          };
          syncWhenPlayerstateChanges = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to do a quick sync when the audio player state changes

              Type: Bool
            '';
          };
          syncWhenUpdatingFeeds = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to sync when a feed update is triggered

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Synchronization";
    };    
  };
  config = mkIf (cfg.enable && moduleCfg.enable) {
    home.packages = mkIf moduleCfg.package [ moduleCfg.package ];
    programs.plasma.files."kastsrc" = removeAttrs moduleCfg [ "enable" "package" ];
  };
}
