{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kmail = { 
    "Behaviour" = with types; mkOption {
      type = submodule {
        options = { 
          ActionEnterFolder = mkOption {
            type = nullOr (either str (enum [ 
              "SelectFirstUnread"
              "SelectLastSelected"
              "SelectNewest"
              "SelectOldest"
            ]));
            default = "SelectLastSelected";
            description = ''
              

              Type: Enum
              Choices: 
                - SelectFirstUnread
                - SelectLastSelected
                - SelectNewest
                - SelectOldest
            '';
          };
          AllowLocalFlags = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow local flags in read-only folders

              Type: Bool
            '';
          };
          EnableFolderDnD = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ExcludeImportantMailFromExpiry = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          LoopOnGotoUnread = mkOption {
            type = nullOr (either str (enum [ 
              "DontLoop"
              "LoopInCurrentFolder"
              "LoopInAllFolders"
              "LoopInAllMarkedFolders"
            ]));
            default = "DontLoop";
            description = ''
              

              Type: Enum
              Choices: 
                - DontLoop
                - LoopInCurrentFolder
                - LoopInAllFolders
                - LoopInAllMarkedFolders
            '';
          };
          NetworkState = mkOption {
            type = nullOr (either str (enum [ 
              "Online"
              "Offline"
            ]));
            default = "Online";
            description = ''
              

              Type: Enum
              Choices: 
                - Online
                - Offline
            '';
          };
          SendOnCheck = mkOption {
            type = nullOr (either str (enum [ 
              "DontSendOnCheck"
              "SendOnManualChecks"
              "SendOnAllChecks"
            ]));
            default = "DontSendOnCheck";
            description = ''
              Send queued mail on mail check

              Type: Enum
              Choices: 
                - DontSendOnCheck
                - SendOnManualChecks
                - SendOnAllChecks
            '';
          };
          ShowPopupAfterDnD = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Behaviour";
    };    
    "Composer" = with types; mkOption {
      type = submodule {
        options = { 
          CheckSendDefaultActionShortcut = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Validate Send Default Shortcut

              Type: Bool
            '';
          };
          "Completion Mode" = mkOption {
            type = nullOr (either str int);
            default = "KCompletion::CompletionPopup";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
          CustomTemplates = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          ForwardingInlineByDefault = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Forward Inline As Default.

              Type: Bool
            '';
          };
          PreviousDictionary = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          ShowCryptoLabelIndicator = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show crypto label indicator

              Type: Bool
            '';
          };
          ShowCryptoOwnertrust = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show crypto ownertrust icons

              Type: Bool
            '';
          };
          ShowSnippetManager = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show the Text Snippet Management and Insertion Panel in the composer.

              Type: Bool
            '';
          };
          SnippetSplitterPosition = mkOption {
            type = nullOr (either str (listOf int));
            default = "";
            description = ''
              

              Type: IntList
            '';
          };
          "always-encrypt-drafts" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "attachment-keywords" = mkOption {
            type = nullOr (either str (listOf str));
            default = "
        MessageComposer::Util::AttachmentKeywords()
        ";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          autoSpellChecking = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          autosave = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              Autosave interval:

              Type: Int
            '';
          };
          "check-spelling-before-send" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Check spelling before send

              Type: Bool
            '';
          };
          "confirm-before-send" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Confirm &before send

              Type: Bool
            '';
          };
          "confirm-before-send-when-use-shortcut" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "crypto-store-encrypted" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              When check, sent messages will be stored in the encrypted form

              Type: Bool
            '';
          };
          "current-transport" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          headers = mkOption {
            type = nullOr (either str int);
            default = "KMail::Composer::HDR_SUBJECT|KMail::Composer::HDR_FROM";
            description = ''
              

              Type: Int
            '';
          };
          "html-markup" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "previous-fcc" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "previous-identity" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              

              Type: UInt
            '';
          };
          "recent-encoding" = mkOption {
            type = nullOr (either str (listOf str));
            default = "
        QStringList()
        ";
            defaultText = "Code: true";
            description = ''
              A list of all the recently used encodings

              Type: StringList
            '';
          };
          "recent-urls" = mkOption {
            type = nullOr (either str (listOf str));
            default = "
        QStringList()
        ";
            defaultText = "Code: true";
            description = ''
              A list of all the recently used URLs

              Type: StringList
            '';
          };
          "recipient-threshold" = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              

              Type: Int
              Min: 1
              Max: 100
            '';
          };
          "request-mdn" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Automatically request &message disposition notifications

              Type: Bool
            '';
          };
          showForgottenAttachmentWarning = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "too-many-recipients" = mkOption {
            type = nullOr (either str bool);
            default = "${WARN_TOOMANY_RECIPIENTS_DEFAULT}";
            description = ''
              Warn if the number of recipients is more than:

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Composer";
    };    
    "FolderSelectionDialog" = with types; mkOption {
      type = submodule {
        options = { 
          LastSelectedFolder = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "FolderSelectionDialog";
    };    
    "Fonts" = with types; mkOption {
      type = submodule {
        options = { 
          "composer-font" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Fonts";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          AskEnableUnifiedMailboxes = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to ask if users wants to enable Unified Mailboxes if more than one email accounts are detected. We only ever ask once.

              Type: Bool
            '';
          };
          CloseToQuotaThreshold = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              The threshold for when to warn the user that a folder is nearing its quota limit.

              Type: Int
            '';
          };
          ComposerShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ReaderShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowMenuBar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowUnreadInTaskbar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show Unread Email in TaskBar

              Type: Bool
            '';
          };
          StartInTray = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Start minimized to tray

              Type: Bool
            '';
          };
          SystemTrayEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable system tray icon

              Type: Bool
            '';
          };
          "auto-expiring" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Specifies whether the folders will expire in the background (for internal use only)

              Type: Bool
            '';
          };
          "check-collections-indexing" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          createDefaultBoxes = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "delete-messages-without-confirmation" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Delete messages without confirmation

              Type: Bool
            '';
          };
          "empty-trash-on-exit" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Empty the local trash folder on program exit

              Type: Bool
            '';
          };
          enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "external-editor" = mkOption {
            type = nullOr str;
            default = "kwrite %f";
            description = ''
              Specify e&ditor:

              Type: String
            '';
          };
          "first-start" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Specifies whether this is the very first time that the application is run (for internal use only)

              Type: Bool
            '';
          };
          fixedSpecialCollections = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "mime-header-count" = mkOption {
            type = nullOr (either str int);
            default = "";
            description = ''
              Specifies the number of custom MIME header fields to be inserted in messages (for internal use only)

              Type: Int
            '';
          };
          startSpecificFolderAtStatup = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow to start specific folder

              Type: Bool
            '';
          };
          startupFolder = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Specify the folder to open when the program is started

              Type: Int
            '';
          };
          "use-external-editor" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use e&xternal editor instead of composer

              Type: Bool
            '';
          };
          "warn-before-expire" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Geometry" = with types; mkOption {
      type = submodule {
        options = { 
          ConfigureDialogHeight = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              The height of the Configure KMail dialog (for internal use only)

              Type: Int
            '';
          };
          ConfigureDialogWidth = mkOption {
            type = nullOr (either str int);
            default = 800;
            description = ''
              The width of the Configure KMail dialog (for internal use only)

              Type: Int
            '';
          };
          FolderList = mkOption {
            type = nullOr (either str (enum [ 
              "longlist"
              "shortlist"
            ]));
            default = "longlist";
            description = ''
              Folder List

              Type: Enum
              Choices: 
                - longlist: Long folder list
                - shortlist: Short folder list
            '';
          };
          FolderTreeHeight = mkOption {
            type = nullOr (either str int);
            default = 400;
            description = ''
              

              Type: Int
            '';
          };
          FolderViewHeight = mkOption {
            type = nullOr (either str int);
            default = 500;
            description = ''
              

              Type: Int
            '';
          };
          FolderViewWidth = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              

              Type: Int
            '';
          };
          "Identity Dialog size" = mkOption {
            type = nullOr str;
            default = "QSize()";
            description = ''
              The size of the identity dialog (for internal use only)

              Type: Size
            '';
          };
          ReaderWindowHeight = mkOption {
            type = nullOr (either str int);
            default = 320;
            description = ''
              

              Type: Int
            '';
          };
          ReaderWindowWidth = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              

              Type: Int
            '';
          };
          SearchAndHeaderHeight = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              

              Type: Int
            '';
          };
          SearchAndHeaderWidth = mkOption {
            type = nullOr (either str int);
            default = 450;
            description = ''
              

              Type: Int
            '';
          };
          SearchWidgetHeight = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              The height of the search window (for internal use only)

              Type: Int
            '';
          };
          SearchWidgetWidth = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              The width of the search window (for internal use only)

              Type: Int
            '';
          };
          composer = mkOption {
            type = nullOr str;
            default = "QSize(800,600)";
            description = ''
              

              Type: Size
            '';
          };
          readerWindowMode = mkOption {
            type = nullOr (either str (enum [ 
              "hide"
              "below"
              "right"
            ]));
            default = "below";
            description = ''
              Message Preview Pane

              Type: Enum
              Choices: 
                - hide: Do not show a message preview pane
                - below: Show the message preview pane below the message list
                - right: Show the message preview pane next to the message list
            '';
          };
        };
      };
      default = {};
      description = "Geometry";
    };    
    "GlobalTemplates" = with types; mkOption {
      type = submodule {
        options = { 
          QuoteString = mkOption {
            type = nullOr str;
            default = "TemplateParser::DefaultTemplates::defaultQuoteString()";
            defaultText = "Code: true";
            description = ''
              Quote characters

              Type: String
            '';
          };
          TemplateForward = mkOption {
            type = nullOr str;
            default = "TemplateParser::DefaultTemplates::defaultForward()";
            defaultText = "Code: true";
            description = ''
              Message template for forward

              Type: String
            '';
          };
          TemplateNewMessage = mkOption {
            type = nullOr str;
            default = "TemplateParser::DefaultTemplates::defaultNewMessage()";
            defaultText = "Code: true";
            description = ''
              Message template for new message

              Type: String
            '';
          };
          TemplateReply = mkOption {
            type = nullOr str;
            default = "TemplateParser::DefaultTemplates::defaultReply()";
            defaultText = "Code: true";
            description = ''
              Message template for reply

              Type: String
            '';
          };
          TemplateReplyAll = mkOption {
            type = nullOr str;
            default = "TemplateParser::DefaultTemplates::defaultReplyAll()";
            defaultText = "Code: true";
            description = ''
              Message template for reply to all

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "GlobalTemplates";
    };    
    "Internal" = with types; mkOption {
      type = submodule {
        options = { 
          "PreviousNewFeaturesMD5" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Internal";
    };    
    "MainFolderView" = with types; mkOption {
      type = submodule {
        options = { 
          ToolTipDisplayPolicy = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Specifies the policy used when displaying policy

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "MainFolderView";
    };    
    "Mime #$(pairId)" = with types; mkOption {
      type = submodule {
        options = { 
          name = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          value = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Mime #$(pairId)";
    };    
    "Search" = with types; mkOption {
      type = submodule {
        options = { 
          LastSearchCollectionId = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Search";
    };    
    "SearchDialog" = with types; mkOption {
      type = submodule {
        options = { 
          CollectionWidth = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              Specifies the width of the collection field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
          DateWidth = mkOption {
            type = nullOr (either str int);
            default = 120;
            description = ''
              Specifies the width of the date field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
          FolderWidth = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              Specifies the width of the folder field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
          ReceiverWidth = mkOption {
            type = nullOr (either str int);
            default = 120;
            description = ''
              Specifies the width of the receiver field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
          SenderWidth = mkOption {
            type = nullOr (either str int);
            default = 120;
            description = ''
              Specifies the width of the sender field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
          SubjectWidth = mkOption {
            type = nullOr (either str int);
            default = 150;
            description = ''
              Specifies the width of the subject field in the Search Window dialog (for internal use only)

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "SearchDialog";
    };    
    "UndoSend" = with types; mkOption {
      type = submodule {
        options = { 
          EnabledUndoSend = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          UndoSendDelay = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "UndoSend";
    };    
    "UserInterface" = with types; mkOption {
      type = submodule {
        options = { 
          EnableFolderQuickSearch = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show folder quick search line edit

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "UserInterface";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kmailrc" = cfg.kmail;
  };
}
