{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kgpg = { 
    "Decryption" = with types; mkOption {
      type = submodule {
        options = { 
          "custom_decrypt" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Custom decryption command.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Decryption";
    };    
    "Encryption" = with types; mkOption {
      type = submodule {
        options = { 
          "Allow_untrusted_group_members" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow untrusted keys to become members of key groups.

              Type: Bool
            '';
          };
          "Allow_untrusted_keys" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow encryption with untrusted keys.

              Type: Bool
            '';
          };
          "Ascii_armor" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use ASCII armored encryption.

              Type: Bool
            '';
          };
          "Hide_user_ID" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide the user ID.

              Type: Bool
            '';
          };
          "PGP_compatibility" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable PGP 6 compatibility.

              Type: Bool
            '';
          };
          "Pgp_extension" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use *.pgp extension for encrypted files.

              Type: Bool
            '';
          };
          "allow_custom_option" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow custom encryption options

              Type: Bool
            '';
          };
          "custom_option" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Custom encryption options

              Type: String
            '';
          };
          "encrypt_files_to" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Encrypt files

              Type: Bool
            '';
          };
          "file key" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              File encryption key.

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "Encryption";
    };    
    "GPG Settings" = with types; mkOption {
      type = submodule {
        options = { 
          "gpg_bin_path" = mkOption {
            type = nullOr str;
            default = "gpg";
            description = ''
              The path of the gpg binary used by KGpg.

              Type: Path
            '';
          };
          "gpg_config_path" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The path of the gpg configuration file.

              Type: Path
            '';
          };
        };
      };
      default = {};
      description = "GPG Settings";
    };    
    "General Options" = with types; mkOption {
      type = submodule {
        options = { 
          "First run" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Is the first time the application runs.

              Type: Bool
            '';
          };
          Geometry = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The size of the editor window.

              Type: Size
            '';
          };
          "photo properties" = mkOption {
            type = nullOr (either str (enum [ 
              "Disable"
              "Small"
              "Medium"
              "Big"
            ]));
            default = "Disable";
            description = ''
              

              Type: Enum
              Choices: 
                - Disable
                - Small
                - Medium
                - Big
            '';
          };
          "show_creat" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the creation value in key manager.

              Type: Bool
            '';
          };
          "show_expi" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the expiration value in key manager.

              Type: Bool
            '';
          };
          "show_long_keyid" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show long key id in key manager.

              Type: Bool
            '';
          };
          "show_secret" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show only secret keys in key manager.

              Type: Bool
            '';
          };
          "show_size" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the size value in key manager.

              Type: Bool
            '';
          };
          "show_trust" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the trust value in key manager.

              Type: Bool
            '';
          };
          "trust filter" = mkOption {
            type = nullOr (either str (enum [ 
              "Unknown"
              "Undefined"
              "Marginal"
              "Full"
              "Ultimate"
            ]));
            default = "Undefined";
            description = ''
              Show only keys with at least that trust level in key manager.

              Type: Enum
              Choices: 
                - Unknown
                - Undefined
                - Marginal
                - Full
                - Ultimate
            '';
          };
        };
      };
      default = {};
      description = "General Options";
    };    
    "Key Colors" = with types; mkOption {
      type = submodule {
        options = { 
          "color_bad" = mkOption {
            type = nullOr str;
            default = "172,0,0";
            description = ''
              Color used for untrusted keys.

              Type: Color
            '';
          };
          "color_expired" = mkOption {
            type = nullOr str;
            default = "150,150,150";
            description = ''
              Color used for expired keys.

              Type: Color
            '';
          };
          "color_good" = mkOption {
            type = nullOr str;
            default = "144,255,0";
            description = ''
              Color used for trusted keys.

              Type: Color
            '';
          };
          "color_marginal" = mkOption {
            type = nullOr str;
            default = "255,255,0";
            description = ''
              Color used for marginally trusted keys.

              Type: Color
            '';
          };
          "color_revoked" = mkOption {
            type = nullOr str;
            default = "30,30,30";
            description = ''
              Color used for revoked keys.

              Type: Color
            '';
          };
          "color_ultimate" = mkOption {
            type = nullOr str;
            default = "68,0,255";
            description = ''
              Color used for ultimately trusted keys.

              Type: Color
            '';
          };
          "color_unknown" = mkOption {
            type = nullOr str;
            default = "255,255,255";
            description = ''
              Color used for unknown keys.

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Key Colors";
    };    
    "Key List" = with types; mkOption {
      type = submodule {
        options = { 
          EmailSorting = mkOption {
            type = nullOr (either str (enum [ 
              "Alphabetical"
              "TLDfirst"
              "DomainFirst"
              "FQDNFirst"
            ]));
            default = "Alphabetical";
            description = ''
              

              Type: Enum
              Choices: 
                - Alphabetical
                - TLDfirst
                - DomainFirst
                - FQDNFirst
            '';
          };
        };
      };
      default = {};
      description = "Key List";
    };    
    "Key Servers" = with types; mkOption {
      type = submodule {
        options = { 
          "use_proxy" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use HTTP proxy when available.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Key Servers";
    };    
    "Key Signing" = with types; mkOption {
      type = submodule {
        options = { 
          "Email_Template" = mkOption {
            type = nullOr str;
            default = "EMailTemplateText";
            defaultText = "Code: true";
            description = ''
              This is the text of the email sent by the "Sign and Mail User ID" action.

              Type: String
            '';
          };
          "Mail_Uats" = mkOption {
            type = nullOr (either str (enum [ 
              "All"
              "First"
              "None"
            ]));
            default = "All";
            description = ''
              

              Type: Enum
              Choices: 
                - All
                - First
                - None
            '';
          };
        };
      };
      default = {};
      description = "Key Signing";
    };    
    "Servers" = with types; mkOption {
      type = submodule {
        options = { 
          "Info_Server_List" = mkOption {
            type = nullOr (either str (listOf str));
            default = "https://pgp.cs.uu.nl/stats/$$id16$$.html,http://pgp.surfnet.nl:11371/pks/lookup?op=vindex&fingerprint=on&search=0x$$ID8$$;http://biglumber.com/x/web?pk=$$FPR$$";
            description = ''
              List of URLs that show details and analysis of the given key. The first server in the list is the default server.

              Type: StringList
            '';
          };
          "Server_List" = mkOption {
            type = nullOr (either str (listOf str));
            default = "hkp://pool.sks-keyservers.net,hkp://subkeys.pgp.net,hkp://search.keyserver.net,hkp://pgp.dtype.org,hkp://wwwkeys.pgp.net";
            description = ''
              Key servers used by KGpg. The first server in the list is the default server.

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Servers";
    };    
    "Text Font" = with types; mkOption {
      type = submodule {
        options = { 
          KEditFont = mkOption {
            type = nullOr str;
            default = "QFontDatabase::systemFont(QFontDatabase::FixedFont)";
            defaultText = "Code: true";
            description = ''
              Font

              Type: Font
            '';
          };
        };
      };
      default = {};
      description = "Text Font";
    };    
    "TipOfDay" = with types; mkOption {
      type = submodule {
        options = { 
          RunOnStart = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show tip of the day.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "TipOfDay";
    };    
    "User Interface" = with types; mkOption {
      type = submodule {
        options = { 
          AutoStart = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Start KGpg automatically at KDE startup.

              Type: Bool
            '';
          };
          "decrypt_menu" = mkOption {
            type = nullOr (either str (enum [ 
              "Disabled"
              "AllFiles"
              "EncryptedFiles"
            ]));
            default = "Disabled";
            description = ''
              Show the "decrypt file" service menu.

              Type: Enum
              Choices: 
                - Disabled
                - AllFiles
                - EncryptedFiles
            '';
          };
          "encrypted_drop_event" = mkOption {
            type = nullOr (either str (enum [ 
              "DecryptAndSave"
              "DecryptAndOpen"
              "Ask"
            ]));
            default = "";
            description = ''
              Handle encrypted drops

              Type: Enum
              Choices: 
                - DecryptAndSave
                - DecryptAndOpen
                - Ask
            '';
          };
          "left_click" = mkOption {
            type = nullOr (either str (enum [ 
              "KeyManager"
              "Editor"
            ]));
            default = "";
            description = ''
              Choose default left-click behavior

              Type: Enum
              Choices: 
                - KeyManager
                - Editor
            '';
          };
          "recent_files" = mkOption {
            type = nullOr (either str int);
            default = 10;
            description = ''
              The number of recently opened files shown in the editor menu.

              Type: UInt
            '';
          };
          "remote_file_warn" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Display a warning before creating temporary files during remote file operations.

              Type: Bool
            '';
          };
          "selection_clipboard" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use the mouse selection instead of the clipboard.

              Type: Bool
            '';
          };
          "sign_menu" = mkOption {
            type = nullOr (either str (enum [ 
              "Disabled"
              "AllFiles"
            ]));
            default = "Disabled";
            description = ''
              Show the "sign file" service menu.

              Type: Enum
              Choices: 
                - Disabled
                - AllFiles
            '';
          };
          "systray_icon" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show the systray icon

              Type: Bool
            '';
          };
          "unencrypted_drop_event" = mkOption {
            type = nullOr (either str (enum [ 
              "Encrypt"
              "Sign"
              "Ask"
            ]));
            default = "";
            description = ''
              Handle unencrypted drops

              Type: Enum
              Choices: 
                - Encrypt
                - Sign
                - Ask
            '';
          };
        };
      };
      default = {};
      description = "User Interface";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kgpgrc" = cfg.kgpg;
  };
}
