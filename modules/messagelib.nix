{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.messagelib = { 
    "AutoResizeImage" = with types; mkOption {
      type = submodule {
        options = { 
          FilterRecipientType = mkOption {
            type = nullOr (either str (enum [ 
              "NoFilter"
              "ResizeEachEmailsContainsPattern"
              "ResizeOneEmailContainsPattern"
              "DontResizeEachEmailsContainsPattern"
              "DontResizeOneEmailContainsPattern"
            ]));
            default = "NoFilter";
            description = ''
              

              Type: Enum
              Choices: 
                - NoFilter
                - ResizeEachEmailsContainsPattern
                - ResizeOneEmailContainsPattern
                - DontResizeEachEmailsContainsPattern
                - DontResizeOneEmailContainsPattern
            '';
          };
          FilterSourceType = mkOption {
            type = nullOr (either str (enum [ 
              "NoFilter"
              "IncludeFilesWithPattern"
              "ExcludeFilesWithPattern"
            ]));
            default = "NoFilter";
            description = ''
              

              Type: Enum
              Choices: 
                - NoFilter
                - IncludeFilesWithPattern
                - ExcludeFilesWithPattern
            '';
          };
          "ask-before-resizing" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "auto-resize-image-enabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "custom-maximum-height" = mkOption {
            type = nullOr (either str int);
            default = 520;
            description = ''
              

              Type: Int
            '';
          };
          "custom-maximum-width" = mkOption {
            type = nullOr (either str int);
            default = 520;
            description = ''
              

              Type: Int
            '';
          };
          "custom-minimum-height" = mkOption {
            type = nullOr (either str int);
            default = 520;
            description = ''
              

              Type: Int
            '';
          };
          "custom-minimum-width" = mkOption {
            type = nullOr (either str int);
            default = 520;
            description = ''
              

              Type: Int
            '';
          };
          "do-not-resize-emails-pattern" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "enlarge-image-to-minimum" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "filter-source-pattern" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "keep-image-ratio" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "maximum-height" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "maximum-width" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "minimum-height" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "minimum-width" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: Int
            '';
          };
          "reduce-image-to-maximum" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "rename-resized-images" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "rename-resized-images-pattern" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "resize-emails-pattern" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "resize-image-with-formats" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "resize-image-with-formats-type" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "skip-image-lower-size" = mkOption {
            type = nullOr (either str int);
            default = 220;
            description = ''
              

              Type: Int
            '';
          };
          "skip-image-lower-size-enabled" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "write-format" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "AutoResizeImage";
    };    
    "Autocorrect" = with types; mkOption {
      type = submodule {
        options = { 
          "add-non-breaking-space" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "advanced-autocorrect" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "auto-bold-underline" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "auto-fractions" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "autoformat-url" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "capitalize-week-days" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          enabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "fix-two-upper-case-chars" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "replace-double-quotes" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "replace-single-quotes" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "single-spaces" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "super-script" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "upper-case-first-char-of-sentence" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Autocorrect";
    };    
    "Behaviour" = with types; mkOption {
      type = submodule {
        options = { 
          DelayedMarkAsRead = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          DelayedMarkTime = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "Behaviour";
    };    
    "CTemplates #$(name)" = with types; mkOption {
      type = submodule {
        options = { 
          CC = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Content = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Template content

              Type: String
            '';
          };
          Shortcut = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Template shortcut

              Type: String
            '';
          };
          To = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          Type = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Template type

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "CTemplates #$(name)";
    };    
    "Composer" = with types; mkOption {
      type = submodule {
        options = { 
          AllowSemicolonAsAddressSeparator = mkOption {
            type = nullOr (either str bool);
            default = "${ALLOW_SEMICOLON_AS_ADDRESS_SEPARATOR_DEFAULT}";
            description = ''
              Allow the semicolon character (';') to be used as separator in the message composer

              Type: Bool
            '';
          };
          MaximumAttachmentSize = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              The maximum size in bits that email attachments are allowed to have (-1 for no limit)

              Type: Int
            '';
          };
          MaximumRecipients = mkOption {
            type = nullOr (either str int);
            default = 200;
            description = ''
              Maximum number of recipient entries:

              Type: Int
            '';
          };
          QuoteSelectionOnly = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Only quote selected text when replying

              Type: Bool
            '';
          };
          "break-at" = mkOption {
            type = nullOr (either str int);
            default = 78;
            description = ''
              

              Type: Int
              Min: 30
              Max: 998
            '';
          };
          "crypto-auto-encrypt" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable encryption, if we found keys for all recipients

              Type: Bool
            '';
          };
          "crypto-auto-sign" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Sign all messages, if possible

              Type: Bool
            '';
          };
          "crypto-show-keys-for-approval" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Always show the list of encryption keys to select the one which will be used

              Type: Bool
            '';
          };
          "crypto-warn-encr-chaincert-near-expire-int" = mkOption {
            type = nullOr (either str int);
            default = 14;
            description = ''
              The minimum number of days that all certificates in the chain should be valid before issuing a warning

              Type: Int
            '';
          };
          "crypto-warn-encr-key-near-expire-int" = mkOption {
            type = nullOr (either str int);
            default = 14;
            description = ''
              The minimum number of days that the encryption certificate should be valid before issuing a warning

              Type: Int
            '';
          };
          "crypto-warn-encr-root-near-expire-int" = mkOption {
            type = nullOr (either str int);
            default = 14;
            description = ''
              The minimum number of days that the root certificate should be valid before issuing a warning

              Type: Int
            '';
          };
          "crypto-warn-own-encr-key-near-expire-int" = mkOption {
            type = nullOr (either str int);
            default = 30;
            description = ''
              The minimum number of days that the encryption certificate should be valid before issuing a warning

              Type: Int
            '';
          };
          "crypto-warn-when-near-expire" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Warn if certificates/keys expire soon (configure thresholds below)

              Type: Bool
            '';
          };
          "crypto-warning-unencrypted" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Warn before sending unencrypted messages

              Type: Bool
            '';
          };
          "crypto-warning-unsigned" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Warn before sending unsigned messages

              Type: Bool
            '';
          };
          "dash-dash-signature" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prepend separator to signature

              Type: Bool
            '';
          };
          "force-reply-charset" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Keep original charset when replying or forwarding if possible

              Type: Bool
            '';
          };
          "forward-prefixes" = mkOption {
            type = nullOr (either str (listOf str));
            default = "Fwd:,FW:";
            description = ''
              

              Type: StringList
            '';
          };
          "improve-plain-text-html-message" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Improve plain text version of HTML message

              Type: Bool
            '';
          };
          myMessageIdSuffix = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "outlook-compatible-attachments" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Outlook-compatible attachment naming

              Type: Bool
            '';
          };
          "pref-charsets" = mkOption {
            type = nullOr (either str (listOf str));
            default = "us-ascii,iso-8859-1,locale,utf-8";
            description = ''
              

              Type: StringList
            '';
          };
          "prepend-signature" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Insert signature above quoted text

              Type: Bool
            '';
          };
          "replace-forward-prefix" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Replace recognized prefix with "&Fwd:"

              Type: Bool
            '';
          };
          "replace-reply-prefix" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Replace recognized prefi&x with "Re:"

              Type: Bool
            '';
          };
          "reply-prefixes" = mkOption {
            type = nullOr (either str (listOf str));
            default = "Re\\s*:,Re\\[\\d+\\]:,Re\\d+:";
            description = ''
              

              Type: StringList
            '';
          };
          showBalooSearchInComposer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use addresses indexed from emails for autocompletion

              Type: Bool
            '';
          };
          showRecentAddressesInComposer = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use recent addresses for autocompletion

              Type: Bool
            '';
          };
          signature = mkOption {
            type = nullOr str;
            default = "auto";
            description = ''
              A&utomatically insert signature

              Type: String
            '';
          };
          "use-fixed-font" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Fi&xed Font

              Type: Bool
            '';
          };
          useCustomMessageIdSuffix = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          "word-wrap" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Word &wrap at column:

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Composer";
    };    
    "DKIM" = with types; mkOption {
      type = submodule {
        options = { 
          AutogenerateRule = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          AutogenerateRuleOnlyIfSenderOnSDID = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          CheckIfEmailShouldBeSigned = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          EnabledDkim = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          "PolicyRsaSha1" = mkOption {
            type = nullOr (either str (enum [ 
              "Nothing"
              "Warning"
              "Error"
            ]));
            default = "Warning";
            description = ''
              

              Type: Enum
              Choices: 
                - Nothing
                - Warning
                - Error
            '';
          };
          PublicRsaTooSmall = mkOption {
            type = nullOr (either str (enum [ 
              "Nothing"
              "Warning"
              "Error"
            ]));
            default = "Warning";
            description = ''
              

              Type: Enum
              Choices: 
                - Nothing
                - Warning
                - Error
            '';
          };
          SaveDkimResult = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          SaveKey = mkOption {
            type = nullOr (either str (enum [ 
              "NotSaving"
              "Save"
              "SaveAndCompare"
            ]));
            default = "NotSaving";
            description = ''
              

              Type: Enum
              Choices: 
                - NotSaving
                - Save
                - SaveAndCompare
            '';
          };
          UseAuthenticationResults = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          UseDMarc = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          UseDefaultRules = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          UseOnlyAuthenticationResults = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          UseRelaxedParsingAuthenticationResults = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
          VerifySignatureWhenOnlyTest = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: bool
            '';
          };
        };
      };
      default = {};
      description = "DKIM";
    };    
    "Event" = with types; mkOption {
      type = submodule {
        options = { 
          LastEventSelectedFolder = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Event";
    };    
    "Fonts" = with types; mkOption {
      type = submodule {
        options = { 
          MinimumFontSize = mkOption {
            type = nullOr (either str int);
            default = 8;
            description = ''
              When we render html do not use font size inferior to minimum size.

              Type: Int
            '';
          };
          "body-font" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              Specifies the font to use for the message body

              Type: Font
            '';
          };
          defaultFonts = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          "fixed-font" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::FixedFont)";
            defaultText = "Code: true";
            description = ''
              

              Type: Font
            '';
          };
          "print-font" = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            defaultText = "Code: true";
            description = ''
              Specifies the font to use for printing

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
          customDateFormat = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          dateFormat = mkOption {
            type = nullOr (either str int);
            default = "int( KMime::DateFormatter::Fancy )";
            defaultText = "Code: true";
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "GrantleeDefaultTheme" = with types; mkOption {
      type = submodule {
        options = { 
          ThemeName = mkOption {
            type = nullOr str;
            default = "5.2";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "GrantleeDefaultTheme";
    };    
    "Invitations" = with types; mkOption {
      type = submodule {
        options = { 
          AskForCommentWhenReactingToInvitation = mkOption {
            type = nullOr (either str (enum [ 
              "NeverAsk"
              "AskForAllButAcceptance"
              "AlwaysAsk"
            ]));
            default = "AskForAllButAcceptance";
            description = ''
              

              Type: Enum
              Choices: 
                - NeverAsk
                - AskForAllButAcceptance
                - AlwaysAsk
            '';
          };
          AutomaticSending = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatic invitation sending

              Type: Bool
            '';
          };
          DeleteInvitationEmailsAfterSendingReply = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Delete invitation emails after the reply to them has been sent

              Type: Bool
            '';
          };
          ExchangeCompatibleInvitations = mkOption {
            type = nullOr (either str bool);
            default = "${EXCHANGE_COMPATIBLE_INVITATIONS}";
            description = ''
              Exchange-compatible invitation naming

              Type: Bool
            '';
          };
          LegacyBodyInvites = mkOption {
            type = nullOr (either str bool);
            default = "${LEGACY_BODY_INVITES}";
            description = ''
              Send groupware invitations in the mail body

              Type: Bool
            '';
          };
          LegacyMangleFromToHeaders = mkOption {
            type = nullOr (either str bool);
            default = "${LEGACY_MANGLE_FROM_TO_HEADERS}";
            description = ''
              Mangle From:/To: headers in replies to replies

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Invitations";
    };    
    "MDN" = with types; mkOption {
      type = submodule {
        options = { 
          "default-policy" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Specifies the default policy to use, for the Message Disposition Notifications (for internal use only)

              Type: Int
            '';
          };
          "not-send-when-encrypted" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Do not send MDNs in response to encrypted messages

              Type: Bool
            '';
          };
          "quote-message" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Specifies the default quoting action to take, when replying to a message (for internal use only)

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "MDN";
    };    
    "MessageListView" = with types; mkOption {
      type = submodule {
        options = { 
          MessageToolTipEnabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display tooltips for messages and group headers

              Type: Bool
            '';
          };
          ShowQuickSearch = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          TagSelected = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "MessageListView";
    };    
    "MessageListView::Colors" = with types; mkOption {
      type = submodule {
        options = { 
          ImportantMessageColor = mkOption {
            type = nullOr str;
            default = "MessageList::Util::importantDefaultMessageColor()";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          TodoMessageColor = mkOption {
            type = nullOr str;
            default = "MessageList::Util::todoDefaultMessageColor()";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
          UnreadMessageColor = mkOption {
            type = nullOr str;
            default = "MessageList::Util::unreadDefaultMessageColor()";
            defaultText = "Code: true";
            description = ''
              

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "MessageListView::Colors";
    };    
    "MessageListView::Fonts" = with types; mkOption {
      type = submodule {
        options = { 
          ImportantMessageFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            description = ''
              

              Type: Font
            '';
          };
          MessageListFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            description = ''
              

              Type: Font
            '';
          };
          TodoMessageFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            description = ''
              

              Type: Font
            '';
          };
          UnreadMessageFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::GeneralFont)";
            description = ''
              

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "MessageListView::Fonts";
    };    
    "Note" = with types; mkOption {
      type = submodule {
        options = { 
          LastNoteSelectedFolder = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Note";
    };    
    "Print" = with types; mkOption {
      type = submodule {
        options = { 
          "print-always-show-encryption-signature-details" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always show encryption/signature details when we print message

              Type: Bool
            '';
          };
          "print-background-color-images" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Specifies whether the background color and images are also drawn when the page is printed.

              Type: Bool
            '';
          };
          "print-selected-text" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Only print selected text in viewer

              Type: Bool
            '';
          };
          "respect-expand-collapse" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Respect expand/collapse quote mark which is defined in settings during printing.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Print";
    };    
    "QuickSearchWarning" = with types; mkOption {
      type = submodule {
        options = { 
          QuickSearchWarningDoNotShowAgain = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "QuickSearchWarning";
    };    
    "Reader" = with types; mkOption {
      type = submodule {
        options = { 
          AccessKeyEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Activate Access Key

              Type: Bool
            '';
          };
          AlwaysDecrypt = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always decrypt messages when viewing or ask before decrypting

              Type: Bool
            '';
          };
          AutoImportKeys = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          CloseAfterReplyOrForward = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Close message window after replying or forwarding

              Type: Bool
            '';
          };
          CollapseQuoteLevelSpin = mkOption {
            type = nullOr (either str int);
            default = 3;
            description = ''
              Automatic collapse level:

              Type: Int
              Min: 0
              Max: 10
            '';
          };
          MailTrackingUrlEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Scan emails for tracking URLs

              Type: Bool
            '';
          };
          MessagePaneHeight = mkOption {
            type = nullOr (either str int);
            default = 180;
            description = ''
              

              Type: Int
            '';
          };
          MimePaneHeight = mkOption {
            type = nullOr (either str int);
            default = 100;
            description = ''
              

              Type: Int
            '';
          };
          "MimeTreeMode2" = mkOption {
            type = nullOr (either str (enum [ 
              "Never"
              "Always"
            ]));
            default = "Never";
            description = ''
              Message Structure Viewer

              Type: Enum
              Choices: 
                - Never: Show never
                - Always: Show always
            '';
          };
          "QuotedText1" = mkOption {
            type = nullOr str;
            default = "MessageCore::ColorUtil::self()->quoteLevel1DefaultTextColor()";
            defaultText = "Code: true";
            description = ''
              This is the color used in the 1st level of quoted text

              Type: Color
            '';
          };
          "QuotedText2" = mkOption {
            type = nullOr str;
            default = "MessageCore::ColorUtil::self()->quoteLevel2DefaultTextColor()";
            defaultText = "Code: true";
            description = ''
              This is the color used in the 2nd level of quoted text

              Type: Color
            '';
          };
          "QuotedText3" = mkOption {
            type = nullOr str;
            default = "MessageCore::ColorUtil::self()->quoteLevel3DefaultTextColor()";
            defaultText = "Code: true";
            description = ''
              This is the color used in the 3rd level of quoted text

              Type: Color
            '';
          };
          RecycleQuoteColors = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Specifies whether to reuse the quote color, beyond the 3rd level

              Type: Bool
            '';
          };
          ScamDetectionEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              KMail can analyze messages for suspected email scams by looking for common techniques used to deceive you

              Type: Bool
            '';
          };
          ScamDetectionWhiteList = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              List of emails in scam white list

              Type: StringList
            '';
          };
          ShowEmoticons = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ShowExpandQuotesMark = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show expand/collapse quote marks

              Type: Bool
            '';
          };
          ShrinkQuotes = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Reduce font size for quoted text

              Type: Bool
            '';
          };
          ZoomFactor = mkOption {
            type = nullOr (either str float);
            default = 100.0;
            description = ''
              

              Type: Double
            '';
          };
          "attachment-strategy" = mkOption {
            type = nullOr str;
            default = "Smart";
            description = ''
              How attachments are shown

              Type: String
            '';
          };
          defaultColors = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          encoding = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          "header-plugin-style-name" = mkOption {
            type = nullOr str;
            default = "defaultgrantlee";
            description = ''
              What style of headers should be displayed

              Type: String
            '';
          };
          "header-set-displayed" = mkOption {
            type = nullOr str;
            default = "rich";
            description = ''
              How much of headers should be displayed

              Type: String
            '';
          };
          "header-style" = mkOption {
            type = nullOr str;
            default = "fancy";
            description = ''
              What style of headers should be displayed

              Type: String
            '';
          };
          htmlLoadExternal = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow messages to load external references from the Internet

              Type: Bool
            '';
          };
          htmlMail = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Prefer HTML to plain text

              Type: Bool
            '';
          };
          realHtmlMailColor = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Reader";
    };    
    "Security" = with types; mkOption {
      type = submodule {
        options = { 
          CheckPhishingUrl = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Check if url can be a phishing

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Security";
    };    
    "Templates #$(folder)" = with types; mkOption {
      type = submodule {
        options = { 
          QuoteString = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          TemplateForward = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          TemplateNewMessage = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          TemplateReply = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          TemplateReplyAll = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          UseCustomTemplates = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Templates #$(folder)";
    };    
    "Todo" = with types; mkOption {
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
      description = "Todo";
    };    
    "sending mail" = with types; mkOption {
      type = submodule {
        options = { 
          Immediate = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "sending mail";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."mailcomposerrc" = cfg.messagelib;
  };
}
