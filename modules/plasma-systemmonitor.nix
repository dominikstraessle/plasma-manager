{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.plasma-systemmonitor = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          askWhenKilling = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          columnDisplay = mkOption {
            type = nullOr str;
            default = ''{"ioCharactersActuallyReadRate":"text","ioCharactersActuallyWrittenRate":"text","appName":"text","netInbound":"text","netOutbound":"text","usage":"lineScaled","vmPSS":"text"}'';
            description = ''
              

              Type: String
            '';
          };
          columnWidths = mkOption {
            type = nullOr (either str (listOf str));
            default = "0.31,0.10,0.11,0.12,0.12,0.12,0.12";
            description = ''
              

              Type: StringList
            '';
          };
          detailsWidth = mkOption {
            type = nullOr (either str float);
            default = 350.0;
            description = ''
              

              Type: Double
            '';
          };
          height = mkOption {
            type = nullOr (either str float);
            default = 700.0;
            description = ''
              

              Type: Double
            '';
          };
          hiddenPages = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          lastPage = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          lastVisitedPage = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          maximized = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          pageOrder = mkOption {
            type = nullOr (either str (listOf str));
            default = "overview.page,applications.page,history.page,processes.page";
            description = ''
              

              Type: StringList
            '';
          };
          showDetails = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          sidebarCollapsed = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
          sortColumn = mkOption {
            type = nullOr str;
            default = "vmPSS";
            description = ''
              

              Type: String
            '';
          };
          sortDirection = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              

              Type: Int
            '';
          };
          sortedColumns = mkOption {
            type = nullOr (either str (listOf str));
            default = "appName,usage,vmPSS,netInbound,netOutbound,ioCharactersActuallyReadRate,ioCharactersActuallyWrittenRate";
            description = ''
              

              Type: StringList
            '';
          };
          startPage = mkOption {
            type = nullOr str;
            default = "overview.page";
            description = ''
              

              Type: String
            '';
          };
          userFilterMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          viewMode = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              

              Type: UInt
            '';
          };
          width = mkOption {
            type = nullOr (either str float);
            default = 1000.0;
            description = ''
              

              Type: Double
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."plasma-systemmonitorrc" = cfg.plasma-systemmonitor;
  };
}
