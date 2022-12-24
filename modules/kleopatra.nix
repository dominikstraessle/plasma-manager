{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kleopatra = { 
    "CMS" = with types; mkOption {
      type = submodule {
        options = { 
          AllowCertificateCreation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow S/MIME certificate creation

              Type: Bool
            '';
          };
          AllowSigning = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Allow signing with S/MIME certificates

              Type: Bool
            '';
          };
          Enabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable S/MIME

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "CMS";
    };    
    "CertificateCreationWizard" = with types; mkOption {
      type = submodule {
        options = { 
          "CN_placeholder" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Placeholder for CN

              Type: String
            '';
          };
          "CN_prefill" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prefill CN automatically

              Type: Bool
            '';
          };
          "EMAIL_placeholder" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Placeholder for EMAIL

              Type: String
            '';
          };
          "EMAIL_prefill" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prefill EMAIL automatically

              Type: Bool
            '';
          };
          HideAdvanced = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Hide advanced settings

              Type: Bool
            '';
          };
          "NAME_placeholder" = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Placeholder for NAME

              Type: String
            '';
          };
          "NAME_prefill" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Prefill NAME automatically

              Type: Bool
            '';
          };
          ValidityPeriodInDays = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Default validity period

              Type: Int
            '';
          };
          ValidityPeriodInDaysMax = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              Maximum validity period

              Type: Int
            '';
          };
          ValidityPeriodInDaysMin = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Minimum validity period

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "CertificateCreationWizard";
    };    
    "ChecksumOperations" = with types; mkOption {
      type = submodule {
        options = { 
          "checksum-definition-id" = mkOption {
            type = nullOr str;
            default = "sha256sum";
            description = ''
              Checksum program to use when creating checksum files

              Type: String
            '';
          };
        };
      };
      default = {};
      description = "ChecksumOperations";
    };    
    "ConfigurationDialog" = with types; mkOption {
      type = submodule {
        options = { 
          ShowAppearanceConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show appearance configuration

              Type: Bool
            '';
          };
          ShowCryptoOperationsConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show crypto operations configuration

              Type: Bool
            '';
          };
          ShowDirectoryServicesConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show directory services configuration

              Type: Bool
            '';
          };
          ShowGnuPGSystemConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show GnuPG system configuration

              Type: Bool
            '';
          };
          ShowSMimeValidationConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show S/MIME validation configuration

              Type: Bool
            '';
          };
          ShowSmartCardsConfiguration = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show smart cards configuration

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "ConfigurationDialog";
    };    
    "DN" = with types; mkOption {
      type = submodule {
        options = { 
          AttributeOrder = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              DN-Attribute Order

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "DN";
    };    
    "FileOperations" = with types; mkOption {
      type = submodule {
        options = { 
          "ascii-armor" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Create signed or encrypted files as text files.

              Type: Bool
            '';
          };
          "auto-decrypt-verify" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatically start operation based on input detection for decrypt/verify.

              Type: Bool
            '';
          };
          "auto-extract-archives" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Automatically extract archives after decryption.

              Type: Bool
            '';
          };
          "default-archive-cmd" = mkOption {
            type = nullOr str;
            default = "tar";
            description = ''
              Use this command to create file archives.

              Type: String
            '';
          };
          "dont-use-tmp-dir" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Create temporary decrypted files in the folder of the encrypted file.

              Type: Bool
            '';
          };
          "file-extension-pgp" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use pgp as the default extension for generated OpenPGP files

              Type: Bool
            '';
          };
          "symmetric-encryption-only" = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use symmetric encryption only.

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "FileOperations";
    };    
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          ProfilesDisabled = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Disable profile settings

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "Groups" = with types; mkOption {
      type = submodule {
        options = { 
          GroupsEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Enable Groups

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Groups";
    };    
    "Import" = with types; mkOption {
      type = submodule {
        options = { 
          RetrieveSignerKeysAfterImport = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Retrieve signer keys after import

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Import";
    };    
    "Privacy" = with types; mkOption {
      type = submodule {
        options = { 
          BlockedUrlSchemes = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              URL schemes to block

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Privacy";
    };    
    "Smartcard" = with types; mkOption {
      type = submodule {
        options = { 
          AlwaysSearchCardOnKeyserver = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Always search smartcard certificates on keyserver

              Type: Bool
            '';
          };
          "AutoLoadP15Certs" = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Try to load S/MIME certificates from PKCS#15 smartcards

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Smartcard";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kleopatrarc" = cfg.kleopatra;
  };
}
