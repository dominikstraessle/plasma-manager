{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kalzium = { 
    "Calculator" = with types; mkOption {
      type = submodule {
        options = { 
          addAlias = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              This setting tells the molecular calculator whether the add Alias tab should be shown

              Type: Bool
            '';
          };
          alias = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              This setting tells the molecular mass calculator whether extra details such as aliases should be shown

              Type: Bool
            '';
          };
          ideal = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              This setting says whether the user wants the gas to be ideal by default

              Type: Bool
            '';
          };
          mass = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              This setting tells the nuclear calculator whether the amounts are always in terms of mass

              Type: Bool
            '';
          };
          soluteMass = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              This setting tells the concentration calculator that amount of solute is always in mass

              Type: Bool
            '';
          };
          solventVolume = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              This setting tells the concentration calculator that amount of solvent is always in volume

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Calculator";
    };    
    "Colors" = with types; mkOption {
      type = submodule {
        options = { 
          MaxColor = mkOption {
            type = nullOr str;
            default = "#FF0000";
            description = ''
              Selects the color of the maximal value from the gradient

              Type: Color
            '';
          };
          MinColor = mkOption {
            type = nullOr str;
            default = "#FFFFFF";
            description = ''
              Selects the color of the minimal value from the gradient

              Type: Color
            '';
          };
          alkalie = mkOption {
            type = nullOr str;
            default = "#FFEB55";
            description = ''
              Selects the color of the alkali metals

              Type: Color
            '';
          };
          alkaline = mkOption {
            type = nullOr str;
            default = "#00A7B3";
            description = ''
              Selects the color of the alkaline earth metals

              Type: Color
            '';
          };
          "block_d" = mkOption {
            type = nullOr str;
            default = "#FFEB55";
            description = ''
              Selects the color of the elements in block d

              Type: Color
            '';
          };
          "block_f" = mkOption {
            type = nullOr str;
            default = "#E85752";
            description = ''
              Selects the color of the elements in block f

              Type: Color
            '';
          };
          "block_p" = mkOption {
            type = nullOr str;
            default = "#77B753";
            description = ''
              Selects the color of the elements in block p

              Type: Color
            '';
          };
          "block_s" = mkOption {
            type = nullOr str;
            default = "#B14F9A";
            description = ''
              Selects the color of the elements in block s

              Type: Color
            '';
          };
          "color_artificial" = mkOption {
            type = nullOr str;
            default = "#FFA94E";
            description = ''
              Selects the color of artificial elements

              Type: Color
            '';
          };
          "color_liquid" = mkOption {
            type = nullOr str;
            default = "#2C72C8";
            description = ''
              Selects the color of liquid elements

              Type: Color
            '';
          };
          "color_radioactive" = mkOption {
            type = nullOr str;
            default = "#FFFFFF";
            description = ''
              Selects the color of radioactive elements

              Type: Color
            '';
          };
          "color_solid" = mkOption {
            type = nullOr str;
            default = "#E85753";
            description = ''
              Selects the color of solid elements

              Type: Color
            '';
          };
          "color_vapor" = mkOption {
            type = nullOr str;
            default = "#77B754";
            description = ''
              Selects the color of vaporous elements

              Type: Color
            '';
          };
          colorgradientbox = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Selects the default gradient color

              Type: Int
            '';
          };
          "group_1" = mkOption {
            type = nullOr str;
            default = "#B14F9A";
            description = ''
              Selects the color of the elements in group 1

              Type: Color
            '';
          };
          "group_2" = mkOption {
            type = nullOr str;
            default = "#2C72C7";
            description = ''
              Selects the color of the elements in group 2

              Type: Color
            '';
          };
          "group_3" = mkOption {
            type = nullOr str;
            default = "#00B377";
            description = ''
              Selects the color of the elements in group 3

              Type: Color
            '';
          };
          "group_4" = mkOption {
            type = nullOr str;
            default = "#E85752";
            description = ''
              Selects the color of the elements in group 4

              Type: Color
            '';
          };
          "group_5" = mkOption {
            type = nullOr str;
            default = "#FFEB55";
            description = ''
              Selects the color of the elements in group 5

              Type: Color
            '';
          };
          "group_6" = mkOption {
            type = nullOr str;
            default = "#644A9B";
            description = ''
              Selects the color of the elements in group 6

              Type: Color
            '';
          };
          "group_7" = mkOption {
            type = nullOr str;
            default = "#E85290";
            description = ''
              Selects the color of the elements in group 7

              Type: Color
            '';
          };
          "group_8" = mkOption {
            type = nullOr str;
            default = "#00A7B3";
            description = ''
              Selects the color of the elements in group 8

              Type: Color
            '';
          };
          halogene = mkOption {
            type = nullOr str;
            default = "#77B753";
            description = ''
              Selects the color of the halogen elements

              Type: Color
            '';
          };
          metalloid = mkOption {
            type = nullOr str;
            default = "#E8D888";
            description = ''
              Selects the color of the metalloid elements

              Type: Color
            '';
          };
          "noble_gas" = mkOption {
            type = nullOr str;
            default = "#E85290";
            description = ''
              Selects the color of the noble gases

              Type: Color
            '';
          };
          nonmetal = mkOption {
            type = nullOr str;
            default = "#F29B68";
            description = ''
              Selects the color of the non-metal elements

              Type: Color
            '';
          };
          noscheme = mkOption {
            type = nullOr str;
            default = "#2C72C7";
            description = ''
              Selects the color if no scheme is selected

              Type: Color
            '';
          };
          "other_metal" = mkOption {
            type = nullOr str;
            default = "#8F6B32";
            description = ''
              Selects the color of the metals which do not fit into the other categories

              Type: Color
            '';
          };
          rare = mkOption {
            type = nullOr str;
            default = "#644A9B";
            description = ''
              Selects the color of the rare-earth elements

              Type: Color
            '';
          };
          transition = mkOption {
            type = nullOr str;
            default = "#00B377";
            description = ''
              Selects the color of the transition elements

              Type: Color
            '';
          };
        };
      };
      default = {};
      description = "Colors";
    };    
    "Isotope Table" = with types; mkOption {
      type = submodule {
        options = { 
          isotopeTableMode = mkOption {
            type = nullOr (either str (enum [ 
              "isotopeTableMode_0"
              "isotopeTableMode_1"
              "isotopeTableMode_2"
              "isotopeTableMode_3"
            ]));
            default = "isotopeTableMode_0";
            description = ''
              Display-Mode of the Isotope Table

              Type: Enum
              Choices: 
                - isotopeTableMode_0
                - isotopeTableMode_1
                - isotopeTableMode_2
                - isotopeTableMode_3
            '';
          };
        };
      };
      default = {};
      description = "Isotope Table";
    };    
    "Logarithmic Gradients" = with types; mkOption {
      type = submodule {
        options = { 
          LogarithmicBoilingPointGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Boiling Point Gradient feature

              Type: Bool
            '';
          };
          LogarithmicCovalentRadiusGradient = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Covalent Radius Gradient feature

              Type: Bool
            '';
          };
          LogarithmicDiscoverydateGradient = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Discovery Date Gradient feature

              Type: Bool
            '';
          };
          LogarithmicElectronaffinityGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Electron Affinity Gradient feature

              Type: Bool
            '';
          };
          LogarithmicElectronegativityGradient = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Electronegativity Gradient feature

              Type: Bool
            '';
          };
          LogarithmicIonizationGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Ionization Gradient feature

              Type: Bool
            '';
          };
          LogarithmicMassGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Mass Gradient feature

              Type: Bool
            '';
          };
          LogarithmicMeltingPointGradient = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium Melting Point Gradient feature

              Type: Bool
            '';
          };
          LogarithmicVanDerWaalsRadiusGradient = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Whether to use a logarithmic gradient for the Kalzium van der Waals Radius Gradient feature

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Logarithmic Gradients";
    };    
    "Periodic Table" = with types; mkOption {
      type = submodule {
        options = { 
          colorschemebox = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Selects the default color scheme

              Type: Int
            '';
          };
          gradient = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Selects the default gradient

              Type: Int
            '';
          };
          numeration = mkOption {
            type = nullOr (either str int);
            default = 1;
            description = ''
              Selects the default numeration (IUPAC)

              Type: Int
            '';
          };
          pselook = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Whether the atomic mass will be displayed in the PSE-Table

              Type: Int
            '';
          };
          schemaPSE = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Selects the PSE

              Type: Int
            '';
          };
          showlegend = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show or hide the legend

              Type: Bool
            '';
          };
          table = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Selects the table view (default is classical)

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Periodic Table";
    };    
    "Sidebar" = with types; mkOption {
      type = submodule {
        options = { 
          showsidebar = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Show or hide the sidebar

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Sidebar";
    };    
    "Spectrum" = with types; mkOption {
      type = submodule {
        options = { 
          spectrumType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This value defines which Spectrum type is used. Emission or absorption spectrum

              Type: Int
            '';
          };
          spectrumWavelengthUnit = mkOption {
            type = nullOr (either str int);
            default = 2015;
            description = ''
              This value defines which unit is used for the wavelength

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Spectrum";
    };    
    "Units" = with types; mkOption {
      type = submodule {
        options = { 
          "combobox_energies" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This value defines whether eV or kJ/mol should be used within Kalzium

              Type: Int
            '';
          };
          "combobox_length" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This value defines which length scale should be used within Kalzium

              Type: Int
            '';
          };
          "combobox_temperature" = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              This value defines which temperature scale should be used within Kalzium

              Type: Int
            '';
          };
          energiesUnit = mkOption {
            type = nullOr (either str int);
            default = 7022;
            description = ''
              This value defines whether eV or kJ/mol should be used within Kalzium

              Type: Int
            '';
          };
          lengthUnit = mkOption {
            type = nullOr (either str int);
            default = 2016;
            description = ''
              This value defines which length scale should be used within Kalzium

              Type: Int
            '';
          };
          schemaSelected = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              True if schema was last selected

              Type: Bool
            '';
          };
          temperatureUnit = mkOption {
            type = nullOr (either str int);
            default = 6000;
            description = ''
              This value defines which temperature scale should be used within Kalzium

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Units";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kalziumrc" = cfg.kalzium;
  };
}
