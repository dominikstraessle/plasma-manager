{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasmadialer = { 
    "Adaptive blocking" = with types; mkOption {
      type = submodule {
        options = { 
          adaptiveBlocking = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Ignore calls from unknown numbers

              Type: Bool
            '';
          };
          allowAnonymous = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Anonymous numbers

              Type: Bool
            '';
          };
          allowCallback = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Callback within

              Type: Bool
            '';
          };
          allowPreviousOutgoing = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Existing outgoing call to number

              Type: Bool
            '';
          };
          allowedPatterns = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              Allowed patterns

              Type: StringList
            '';
          };
          callbackInterval = mkOption {
            type = nullOr (either str int);
            default = 5;
            description = ''
              Interval to allow

              Type: Int
            '';
          };
          ringOption = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Hang up, Without notification, Silent notification

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Adaptive blocking";
    };    
    "Answer control for the incoming screen" = with types; mkOption {
      type = submodule {
        options = { 
          answerControl = mkOption {
            type = nullOr (either str (enum [ 
              "Buttons"
              "SyncSwipe"
              "AsyncSwipe"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - Buttons
                - SyncSwipe
                - AsyncSwipe
            '';
          };
        };
      };
      default = {};
      description = "Answer control for the incoming screen";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasmadialerrc" = cfg.plasmadialer;
  };
}
