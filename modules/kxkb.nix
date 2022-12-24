{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kxkb = { 
    "Layout" = with types; mkOption {
      type = submodule {
        options = { 
          DisplayNames = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          LayoutList = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          LayoutLoopCount = mkOption {
            type = nullOr (either str int);
            default = -1;
            description = ''
              

              Type: Int
            '';
          };
          Model = mkOption {
            type = nullOr str;
            default = "pc104";
            description = ''
              

              Type: String
            '';
          };
          Options = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
          ResetOldOptions = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          SwitchMode = mkOption {
            type = nullOr str;
            default = "Global";
            description = ''
              

              Type: String
            '';
          };
          Use = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          VariantList = mkOption {
            type = nullOr (either str (listOf str));
            default = "QStringList()";
            defaultText = "Code: true";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Layout";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kxkbrc" = cfg.kxkb;
  };
}
