{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.konversation = { 
    "Aliases" = with types; mkOption {
      type = submodule {
        options = { 
          "AliasList" = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Aliases";
    };    
    "Appearance" = with types; mkOption {
      type = submodule {
        options = { 
          "ShowMenuBar" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TextFont" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          "ListFont" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          "TabFont" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          "CustomTextFont" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CustomListFont" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CustomTabFont" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Timestamping" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowDate" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowDateLine" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TimestampFormat" = mkOption {
            type = nullOr str;
            default = "hh:mm";
            description = ''
              

              Type: String
            '';
          };
          "ShowBacklog" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "BacklogLines" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
          "ShowNickList" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowQuickButtons" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowQuickButtonsInContextMenu" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowModeButtons" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CloseButtons" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoUserhost" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "UseSpacing" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "Spacing" = mkOption {
            type = nullOr (either str int);
            default = "QApplication::style()->layoutSpacing(QSizePolicy::DefaultType, QSizePolicy::DefaultType, Qt::Horizontal)";
            description = ''
              

              Type: Int
            '';
          };
          "Margin" = mkOption {
            type = nullOr (either str int);
            default = "QApplication::style()->pixelMetric(QStyle::PM_LayoutLeftMargin)";
            description = ''
              

              Type: Int
            '';
          };
          "BackgroundImage" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Url
            '';
          };
          "IrcColorCode$(colorNumber)" = mkOption {
            type = nullOr str;
            default = "#c0c0c0";
            description = ''
              

              Type: Color
            '';
          };
          "AllowColorCodes" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "NickColor$(nickNumber)" = mkOption {
            type = nullOr str;
            default = "#000001";
            description = ''
              

              Type: Color
            '';
          };
          "UseColoredNicks" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowTabBarCloseButton" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowTopic" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowNicknameBox" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "UseBoldNicks" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "UseLiteralModes" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "FocusNewQueries" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowIRCViewScrollBar" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Hide the scrollbar

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Appearance";
    };    
    "DCC Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "BufferSize" = mkOption {
            type = nullOr (either str int);
            default = 16384;
            description = ''
              

              Type: Int
            '';
          };
          "MethodToGetOwnIp" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          "SpecificOwnIp" = mkOption {
            type = nullOr str;
            default = "0.0.0.0";
            description = ''
              

              Type: String
            '';
          };
          "SpecificSendPorts" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SendPortsFirst" = mkOption {
            type = nullOr (either str int);
            default = 1026;
            description = ''
              

              Type: Int
            '';
          };
          "SendPortsLast" = mkOption {
            type = nullOr (either str int);
            default = 7000;
            description = ''
              

              Type: UInt
            '';
          };
          "SpecificChatPorts" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ChatPortsFirst" = mkOption {
            type = nullOr (either str int);
            default = 1026;
            description = ''
              

              Type: Int
            '';
          };
          "ChatPortsLast" = mkOption {
            type = nullOr (either str int);
            default = 7000;
            description = ''
              

              Type: UInt
            '';
          };
          "AddPartner" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CreateFolder" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SpaceToUnderscore" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoGet" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoResume" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ChatAutoAccept" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "FastSend" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SendTimeout" = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              

              Type: Int
            '';
          };
          "IPv4Fallback" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "IPv4FallbackIface" = mkOption {
            type = nullOr str;
            default = "eth0";
            description = ''
              

              Type: String
            '';
          };
          "PassiveSend" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "UPnP" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ColumnWidths" = mkOption {
            type = nullOr (either str (listOf int));
            default = "47,90,103,173,70,87,157,87,96,165";
            description = ''
              

              Type: IntList
            '';
          };
          "ColumnOrder" = mkOption {
            type = nullOr (either str (listOf int));
            default = "0,1,2,3,4,5,6,7,8,9";
            description = ''
              

              Type: IntList
            '';
          };
          "ColumnVisible" = mkOption {
            type = nullOr (either str (listOf int));
            default = "1,1,1,1,1,1,1,1,1,1";
            description = ''
              

              Type: IntList
            '';
          };
          "ColumnSorted" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          "ColumnSortDescending" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "DCC Settings";
    };    
    "External Log Viewer" = with types; mkOption {
      type = submodule {
        options = { 
          "UseExternalLogViewer" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "External Log Viewer";
    };    
    "Flags" = with types; mkOption {
      type = submodule {
        options = { 
          "Log" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "LowerLog" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "AddHostnameToLog" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "PrivateOnly" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TabPlacement" = mkOption {
            type = nullOr (either str (enum [ 
              "Top"
              "Bottom"
              "Left"
            ]));
            default = "Left";
            description = ''
              

              Type: Enum
              Choices: 
                - Top
                - Bottom
                - Left
            '';
          };
          "MiddleClickClose" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "UseClickableNicks" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "BringToFront" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HideUnimportantEvents" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HideUnimportantEventsExcludeActive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HideUnimportantEventsExcludeActiveThreshold" = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          "DisableExpansion" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoReconnect" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "ReconnectDelay" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: UInt
            '';
          };
          "ReconnectCount" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          "EncryptionType" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          "FixedMOTD" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "SkipMOTD" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowServerList" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "InputFieldsBackgroundColor" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Flags";
    };    
    "General Options" = with types; mkOption {
      type = submodule {
        options = { 
          "SpellChecking" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CustomVersionReplyEnabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CustomVersionReply" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "UseMultiRowInputBox" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "CommandChar" = mkOption {
            type = nullOr str;
            default = "/";
            description = ''
              

              Type: String
            '';
          };
          "PreShellCommand" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "ShowTrayIcon" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TrayNotify" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TrayNotifyOnlyOwnNick" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TrayNotifyBlink" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "HideToTrayOnStartup" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Start with hidden main window

              Type: Bool
            '';
          };
          "ShowBackgroundImage" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "MultilineEditGeometry" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Size
            '';
          };
          "LogfileBufferSize" = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          "ScrollbackMax" = mkOption {
            type = nullOr (either str int);
            default = 1000;
            description = ''
              

              Type: Int
            '';
          };
          "AutoWhoNicksLimit" = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          "AutoWhoContinuousEnabled" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoWhoContinuousInterval" = mkOption {
            type = nullOr (either str int);
            default = 90;
            description = ''
              

              Type: Int
            '';
          };
          "ShowRealNames" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              &Show real names next to nicknames

              Type: Bool
            '';
          };
          "ChannelDoubleClickAction" = mkOption {
            type = nullOr str;
            default = "/QUERY %u%n";
            description = ''
              

              Type: String
            '';
          };
          "NotifyDoubleClickAction" = mkOption {
            type = nullOr str;
            default = "/QUERY %u%n";
            description = ''
              

              Type: String
            '';
          };
          "Beep" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "RawLog" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "VersionReply" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "MaximumLag" = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              

              Type: Int
            '';
          };
          "RedirectServerAndAppMsgToStatusPane" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "DisableNotifyWhileAway" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "AutoAwayPollInterval" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
              Min: 10
            '';
          };
          "AutomaticRememberLine" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "AutomaticRememberLineOnlyOnTextChange" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "MarkerLineInAllViews" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General Options";
    };    
    "Highlight List" = with types; mkOption {
      type = submodule {
        options = { 
          "HighlightSoundsEnabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HighlightNick" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "HighlightNickColor" = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              

              Type: Color
            '';
          };
          "HighlightOwnLines" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "HighlightOwnLinesColor" = mkOption {
            type = nullOr str;
            default = "#ff0000";
            description = ''
              

              Type: Color
            '';
          };
          "Highlight" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Highlight List";
    };    
    "LauncherEntry" = with types; mkOption {
      type = submodule {
        options = { 
          LauncherEntryCountMode = mkOption {
            type = nullOr (either str (enum [ 
              "CountEvents"
              "CountChannelAndQueries"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - CountEvents: All events
                - CountChannelAndQueries: Channels and queries with events
            '';
          };
          "LauncherEntryCountUseNick" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "LauncherEntryCountUseHighlights" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "LauncherEntryCountUsePrivate" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "LauncherEntryCountUseMsgs" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "LauncherEntryCountUseSystem" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "LauncherEntryCountUseChannelEvents" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "LauncherEntry";
    };    
    "Message Text Colors" = with types; mkOption {
      type = submodule {
        options = { 
          "$(colorName)" = mkOption {
            type = nullOr str;
            default = "#0000ff";
            description = ''
              

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Message Text Colors";
    };    
    "Nick Completion" = with types; mkOption {
      type = submodule {
        options = { 
          "Mode" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "SuffixStart" = mkOption {
            type = nullOr str;
            default = ": ";
            description = ''
              

              Type: String
            '';
          };
          "SuffixMiddle" = mkOption {
            type = nullOr str;
            default = " ";
            description = ''
              

              Type: String
            '';
          };
          "PrefixCharacter" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "CaseSensitive" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Nick Completion";
    };    
    "Notify List" = with types; mkOption {
      type = submodule {
        options = { 
          "NotifyDelay" = mkOption {
            type = nullOr (either str int);
            default = 20;
            description = ''
              

              Type: Int
            '';
          };
          "UseNotify" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "OnStartup" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Open Watched Nicks tab at application startup

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Notify List";
    };    
    "OSD" = with types; mkOption {
      type = submodule {
        options = { 
          "UseOSD" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowOwnNick" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowChannel" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowQuery" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ShowChannelEvent" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "OSDFont" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          "OSDUseCustomColors" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "OSDDuration" = mkOption {
            type = nullOr (either str int);
            default = 3000;
            description = ''
              

              Type: Int
            '';
          };
          "OSDScreen" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "OSDDrawShadow" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "OffsetX" = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              

              Type: Int
            '';
          };
          "OffsetY" = mkOption {
            type = nullOr (either str int);
            default = 50;
            description = ''
              

              Type: Int
            '';
          };
          "Alignment" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "OSDTextColor" = mkOption {
            type = nullOr str;
            default = "#ffffff";
            description = ''
              

              Type: Color
            '';
          };
          "OSDBackgroundColor" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Color
            '';
          };
          "OSDCheckDesktopLock" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "OSD";
    };    
    "Path Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "LogfilePath" = mkOption {
            type = nullOr str;
            default = ''QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)+QLatin1String("/logs"))'';
            defaultText = "Code: true";
            description = ''
              

              Type: Url
            '';
          };
          "DccPath" = mkOption {
            type = nullOr str;
            default = "QUrl::fromLocalFile(QStandardPaths::writableLocation(QStandardPaths::DownloadLocation))";
            defaultText = "Code: true";
            description = ''
              

              Type: Url
            '';
          };
        };
      };
      default = {};
      description = "Path Settings";
    };    
    "PreferencesDialog" = with types; mkOption {
      type = submodule {
        options = { 
          "Size" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Size
            '';
          };
          "LastActiveModule" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "PreferencesDialog";
    };    
    "Proxy" = with types; mkOption {
      type = submodule {
        options = { 
          "ProxyEnabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "ProxyType" = mkOption {
            type = nullOr (either str (enum [ 
              "Socksv5Proxy"
              "HTTPProxy"
            ]));
            default = "Socksv5Proxy";
            description = ''
              

              Type: Enum
              Choices: 
                - Socksv5Proxy
                - HTTPProxy
            '';
          };
          "ProxyAddress" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "ProxyPort" = mkOption {
            type = nullOr (either str int);
            default = 8080;
            description = ''
              

              Type: Int
            '';
          };
          "ProxyUsername" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "ProxyPassword" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Proxy";
    };    
    "QueueRates" = with types; mkOption {
      type = submodule {
        options = { 
          "EmptyingRate $(QueueIndex)" = mkOption {
            type = nullOr (either str (listOf int));
            default = "defaultRate[$(QueueIndex)]";
            defaultText = "Code: true";
            description = ''
              

              Type: IntList
            '';
          };
          "ShowQueueTuner" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "QueueRates";
    };    
    "ServerListDialog" = with types; mkOption {
      type = submodule {
        options = { 
          "Size" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Size
            '';
          };
        };
      };
      default = {};
      description = "ServerListDialog";
    };    
    "Sort Nicknames" = with types; mkOption {
      type = submodule {
        options = { 
          "SortByStatus" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SortByActivity" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "SortCaseInsensitive" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Sort Nicknames";
    };    
    "Tab Notifications" = with types; mkOption {
      type = submodule {
        options = { 
          "TabNotificationsText" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsLeds" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsSystem" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsSystemColor" = mkOption {
            type = nullOr str;
            default = "#C3C300";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsMsgs" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsMsgsColor" = mkOption {
            type = nullOr str;
            default = "#008000";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsPrivate" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsPrivateColor" = mkOption {
            type = nullOr str;
            default = "#800000";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsEvents" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsEventsColor" = mkOption {
            type = nullOr str;
            default = "#008000";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsNick" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsNickColor" = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsHighlights" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "TabNotificationsHighlightsColor" = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              

              Type: Color
            '';
          };
          "TabNotificationsOverride" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Tab Notifications";
    };    
    "Themes" = with types; mkOption {
      type = submodule {
        options = { 
          "IconTheme" = mkOption {
            type = nullOr str;
            default = "default";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Themes";
    };    
    "Web Browser Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "UseCustomBrowser" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "WebBrowserCmd" = mkOption {
            type = nullOr str;
            default = "firefox '%u'";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Web Browser Settings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."konversationrc" = cfg.konversation;
  };
}
