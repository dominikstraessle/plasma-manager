{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kstars = {
    "ASTAP" = with types;
      mkOption {
        type = submodule {
          options = {
            ASTAPDownSample = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Down sample prior to solving. Also called binning. A value 0 will result in auto selection downsampling.

                Type: Bool
              '';
            };
            ASTAPDownSampleValue = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Down sample prior to solving. Also called binning. A value 0 will result in auto selection downsampling.

                Type: Double
              '';
            };
            ASTAPExecutable = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("ASTAP")'';
              defaultText = "Code: true";
              description = ''
                Full path to the ASTAP executable.

                Type: String
              '';
            };
            ASTAPLargeSearchWindow = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Increase search window size.

                Type: Bool
              '';
            };
            ASTAPSearchRadius = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                The program will search in a square spiral around the start position up to this radius.

                Type: Bool
              '';
            };
            ASTAPSearchRadiusValue = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''
                The program will search in a square spiral around the start position up to this radius.

                Type: Double
              '';
            };
            ASTAPUpdateFITS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Update the fits header with the found solution.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "ASTAP";
      };
    "Align" = with types;
      mkOption {
        type = submodule {
          options = {
            AlignAccuracyThreshold = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''
                Accuracy threshold in arcseconds between solution and target coordinates.

                Type: UInt
              '';
            };
            AlignBinning = mkOption {
              type = nullOr str;
              default = "2x2";
              description = ''
                Default camera binning in alignment mode

                Type: String
              '';
            };
            AlignDarkFrame = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Take a dark frame and subtract it before running astrometry operation.

                Type: Bool
              '';
            };
            AlignExposure = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Default alignment exposure value

                Type: Double
              '';
            };
            AlignFilter = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default filter wheel filter in alignment mode

                Type: String
              '';
            };
            AlignGain = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default camera gain in alignment mode

                Type: Double
              '';
            };
            AlignISO = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default camera ISO in alignment mode

                Type: Double
              '';
            };
            AlignSettlingTime = mkOption {
              type = nullOr (either str int);
              default = 1500;
              description = ''
                Time to wait in milliseconds after telescope slewing is complete before starting the next capture.

                Type: UInt
              '';
            };
            AstrometryAPIKey = mkOption {
              type = nullOr str;
              default = "iczikaqstszeptgs";
              description = ''
                astrometry.net API Key

                Type: String
              '';
            };
            AstrometryAPIURL = mkOption {
              type = nullOr str;
              default = "http://nova.astrometry.net";
              description = ''
                astrometry.net API URL

                Type: String
              '';
            };
            AstrometryAutoDownsample = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically downsample based on image size.

                Type: Bool
              '';
            };
            AstrometryAutoUpdateImageScale = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically update image scale when CCD or Mount parameters are updated.

                Type: Bool
              '';
            };
            AstrometryAutoUpdatePosition = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically update position coordinates when mounts completes slewing.

                Type: Bool
              '';
            };
            AstrometryConfFile = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("AstrometryConfFile")'';
              defaultText = "Code: true";
              description = ''
                astrometry.net configuration file

                Type: String
              '';
            };
            AstrometryCustomOptions = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Additional optional astrometry.net options

                Type: String
              '';
            };
            AstrometryDetectParity = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Detect parity and reuse it to speed up solver.

                Type: Bool
              '';
            };
            AstrometryDifferentialSlewing = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Do not use Sync when Slew to Target is selected. Use differential slewing to correct for discrepancies.

                Type: Bool
              '';
            };
            AstrometryDownsample = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                Downsample factor

                Type: UInt
              '';
            };
            AstrometryImageScaleHigh = mkOption {
              type = nullOr (either str float);
              default = "";
              description = ''
                Upper image scale.

                Type: Double
              '';
            };
            AstrometryImageScaleLow = mkOption {
              type = nullOr (either str float);
              default = "";
              description = ''
                Lower image scale.

                Type: Double
              '';
            };
            AstrometryImageScaleUnits = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Image scale units in arcminutes (aw), degrees (dw), or arcsec per pixel (app)

                Type: UInt
              '';
            };
            AstrometryPositionDE = mkOption {
              type = nullOr (either str float);
              default = "";
              description = ''
                User supplied declination value in degrees to be passed to the solver.

                Type: Double
              '';
            };
            AstrometryPositionRA = mkOption {
              type = nullOr (either str float);
              default = "";
              description = ''
                User supplied Right Ascension value in degrees to be passed to the solver.

                Type: Double
              '';
            };
            AstrometryRadius = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''
                The Search Radius for the Estimated Telescope/Image Field Position in degrees.

                Type: Double
              '';
            };
            AstrometryRotatorThreshold = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''


                Type: Double
              '';
            };
            AstrometrySolverBinary = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("AstrometrySolverBinary")'';
              defaultText = "Code: true";
              description = ''
                astrometry.net solve-field binary

                Type: String
              '';
            };
            AstrometrySolverOverlay = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display received FITS images unto solver FOV rectangle in the sky map.

                Type: Bool
              '';
            };
            AstrometrySolverWCS = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                World Coordinate System (WCS). WCS is used to encode RA/DEC coordinates in captured CCD images.

                Type: Bool
              '';
            };
            AstrometryTimeout = mkOption {
              type = nullOr (either str int);
              default = 180;
              description = ''
                Timeout in seconds to wait for astrometry solver to complete.

                Type: UInt
              '';
            };
            AstrometryUseDownsample = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Downsample the image to shrink its size and speed up the solver.

                Type: Bool
              '';
            };
            AstrometryUseImageScale = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Set image scale to speed up solver as it does not have to search index files of different image scales.

                Type: Bool
              '';
            };
            AstrometryUseJPEG = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use JPEG format, instead of FITS, to upload images to the astrometry.net online service.

                Type: Bool
              '';
            };
            AstrometryUseNoFITS2FITS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Do not sanitize FITS. This option should only be checked if astrometry.net version is 0.67 or earlier. Uncheck for any versions greater than 0.67.

                Type: Bool
              '';
            };
            AstrometryUseNoVerify = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                This will prevent the solver from looking at an already existing WCS Header before blindly trying to solve the image. It is recommended to keep it checked.

                Type: Bool
              '';
            };
            AstrometryUsePosition = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Set estimated position to speed up astrometry solver as it does not have to search in other areas of the sky.

                Type: Bool
              '';
            };
            AstrometryUseResort = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Check this option if your image does not have much nebulosity. If it does have strong nebulosity, uncheck it.

                Type: Bool
              '';
            };
            AstrometryUseRotator = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            AstrometryWCSInfo = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("AstrometryWCSInfo")'';
              defaultText = "Code: true";
              description = ''
                astrometry.net wcsinfo binary

                Type: String
              '';
            };
            PAHAutoPark = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically park the mount after Polar Alignment Assistant Tool is complete.

                Type: Bool
              '';
            };
            PAHDirection = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Mount rotation direction during polar alignment.

                Type: String
              '';
            };
            PAHExposure = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Polar Alignment Assistant exposure duration in seconds.

                Type: Double
              '';
            };
            PAHManualSlew = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                User should manually rotate the mount about its axis during polar alignment.

                Type: Bool
              '';
            };
            PAHMountSpeed = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Speed to set mount in Polar Alignment Assistant Tool.

                Type: String
              '';
            };
            PAHRefreshAlgorithm = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                The algorithm used for polar-align refresh.

                Type: String
              '';
            };
            PAHRotaion = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''
                Rotate mount by this many degrees during polar alignment.

                Type: Double
              '';
            };
            SextractorBinary = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("SextractorBinary")'';
              defaultText = "Code: true";
              description = ''


                Type: String
              '';
            };
            SolverGotoOption = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Action to take if solver if successful (Sync, Slew to Target, or None)

                Type: UInt
              '';
            };
            WatneyBinary = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("WatneyBinary")'';
              defaultText = "Code: true";
              description = ''


                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Align";
      };
    "Analyze" = with types;
      mkOption {
        type = submodule {
          options = {
            AnalyzeAlt = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeAz = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeDEC = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeDECp = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeDrift = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeEccentricity = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeHFR = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeMedian = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeMountDEC = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeMountHA = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeMountRA = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeNumCaptureStars = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeNumStars = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzePierSide = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeRA = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeRAp = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeRMS = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeRMSC = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeSNR = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeSkyBg = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeTargetDistance = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AnalyzeTemperature = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Analyze";
      };
    "Capture" = with types;
      mkOption {
        type = submodule {
          options = {
            AdaptiveSampling = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically down sample images based on available resources.

                Type: Bool
              '';
            };
            AlwaysResetSequenceWhenStarting = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                <html><head/><body><p>When starting to process a sequence list, reset all capture counts to zero. Scheduler overrides this option when Remember Job Progress is enabled.</p></body></html>

                Type: Bool
              '';
            };
            AutoDark = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically apply dark subtraction if a suitable dark frame is available.

                Type: Bool
              '';
            };
            AutoStretch = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Perform auto stretch on captured images in FITS Viewer.

                Type: Bool
              '';
            };
            CalibrationADUValue = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Desired flat field ADU

                Type: UInt
              '';
            };
            CalibrationADUValueTolerance = mkOption {
              type = nullOr (either str int);
              default = 1000;
              description = ''
                ADU Value tolerance

                Type: UInt
              '';
            };
            CalibrationFlatDurationIndex = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Index of flat duration option.

                Type: UInt
              '';
            };
            CalibrationFlatSourceIndex = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Index of flat source option.

                Type: UInt
              '';
            };
            CalibrationWallAlt = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Altitude of calibration wall location.

                Type: Double
              '';
            };
            CalibrationWallAz = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Azimuth of calibration wall location.

                Type: Double
              '';
            };
            CaptureDirectory = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Path to capture directory to save images.

                Type: String
              '';
            };
            CapturePosition = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Calculate position after captures.

                Type: Bool
              '';
            };
            DarkLibraryDuration = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''
                Reuse dark frames from the dark library for this many days. If exceeded, a new dark frame shall be captured and stored for future use.

                Type: UInt
              '';
            };
            DefaultObserver = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default observer full name.

                Type: String
              '';
            };
            EnforceAutofocus = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enforce Autofocus HFR limit.

                Type: Bool
              '';
            };
            EnforceAutofocusOnTemperature = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enforce Autofocus on temperature change.

                Type: Bool
              '';
            };
            EnforceGuideDeviation = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enforce guiding deviation limit.

                Type: Bool
              '';
            };
            EnforceRefocusEveryN = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enforce Refocus Every N Minutes.

                Type: Bool
              '';
            };
            EnforceStartGuiderDrift = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enforce maximum acceptable guider drift allowed before starting capture.

                Type: Bool
              '';
            };
            FlatSyncFocus = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Capture flat frames at the same focus position of light frames.

                Type: Bool
              '';
            };
            ForceDSLRPresets = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Force exposure times to align with DSLR exposure presets. This insures accurate exposure times for sub-second exposures.

                Type: Bool
              '';
            };
            GuideDeviation = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Default maximum permittable guide deviation

                Type: Double
              '';
            };
            GuidingSettle = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Wait this many seconds after guiding is resumed before starting capture.

                Type: Double
              '';
            };
            HFRDeviation = mkOption {
              type = nullOr (either str float);
              default = 0.5;
              description = ''
                Default maximum permittable HFR deviation

                Type: Double
              '';
            };
            HFRThresholdPercentage = mkOption {
              type = nullOr (either str float);
              default = 2.5;
              description = ''
                Increase autofocus HFR value by this percentage gain and store it in Capture Module.

                Type: Double
              '';
            };
            InSequenceCheckFrames = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Run In-Sequence HFR check after this many frames.

                Type: UInt
              '';
            };
            ManualCoverTimeout = mkOption {
              type = nullOr (either str int);
              default = 60;
              description = ''
                Cover or uncover telescope dialog timeout in seconds.

                Type: UInt
              '';
            };
            MaxFocusTemperatureDelta = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Default maximum focus temperature delta

                Type: Double
              '';
            };
            MaxStartGuiderDrift = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Maximum acceptable guider drift allowed before starting capture.

                Type: Double
              '';
            };
            MaxTemperatureDiff = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Maximum acceptable difference between requested and measured temperature set point.

                Type: Double
              '';
            };
            PAMultiplier = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Position angle multiplier

                Type: Double
              '';
            };
            PAOffset = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Position angle offset

                Type: Double
              '';
            };
            PAPierSide = mkOption {
              type = nullOr (either str int);
              default = "";
              description = ''
                Position angle calibration pier side

                Type: UInt
              '';
            };
            PlaceholderFomat = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("placeholderFormat")'';
              defaultText = "Code: true";
              description = ''
                How to format captured image filename.

                Type: String
              '';
            };
            RefocusAfterMeridianFlip = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Refocus after meridian flip is done

                Type: Bool
              '';
            };
            RefocusEveryN = mkOption {
              type = nullOr (either str int);
              default = 60;
              description = ''
                Number of minute between forced refocus attempts

                Type: UInt
              '';
            };
            RemoteCaptureDirectory = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Path to remote capture directory to save images.

                Type: String
              '';
            };
            ResetMountModelAfterMeridian = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Reset mount model after meridian flip.

                Type: Bool
              '';
            };
            SaveHFRToFile = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                When saving a sequence file, save current HFR threshold value. By default, zero value is used.

                Type: Bool
              '';
            };
            StretchPreviewSampling = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Set the coarseness of the preview shown when sliding the fitsviewer's stretch parameter sliders. 1 is full resolution, but can be slow, 4 would be coarse resolution and fast.

                Type: UInt
              '';
            };
            SyncFOVPA = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Sync FOV indicator Position Angle with Rotator Settings Position Angle

                Type: Bool
              '';
            };
            UseMedianFocus = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Calculate median focus value after each autofocus operation is complete.

                Type: Bool
              '';
            };
            fileSettingsUseDuration = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Add the capture duration to the capture file name.

                Type: Bool
              '';
            };
            fileSettingsUseFilter = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Add the filter name to the capture file name.

                Type: Bool
              '';
            };
            fileSettingsUseTimestamp = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Add the capture timestamp to the capture file name.

                Type: Bool
              '';
            };
            useDSLRImageViewer = mkOption {
              type = nullOr (either str bool);
              default = "!KSUtils::isHardwareLimited()";
              description = ''
                Display every captured DSLR image in the Image Viewer window.

                Type: Bool
              '';
            };
            useSummaryPreview = mkOption {
              type = nullOr (either str bool);
              default = "!KSUtils::isHardwareLimited()";
              description = ''
                Display every image captured sequence image in the Ekos summary screen preview window.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Capture";
      };
    "Catalogs" = with types;
      mkOption {
        type = submodule {
          options = {
            CatalogFile = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                Filenames of defined custom object catalogs.

                Type: StringList
              '';
            };
            DSOCachePercentage = mkOption {
              type = nullOr (either str int);
              default = 100;
              description = ''
                Percentage of the sky to cache DSOs for.

                Type: UInt
                Min: 5
                Max: 100
              '';
            };
            DSOCatalogFilename = mkOption {
              type = nullOr str;
              default = "dso_main.kscat";
              description = ''
                The filename of the DSO catalog.

                Type: String
              '';
            };
            DSODefaultCatalogFilename = mkOption {
              type = nullOr str;
              default = "OpenNGC.kscat";
              description = ''
                The filename of the default DSO catalog (OpenNGC).

                Type: String
              '';
            };
            DSOMinZoomFactor = mkOption {
              type = nullOr (either str int);
              default = 400;
              description = ''
                Minimum zoom level to render DeepSkyObjects.

                Type: UInt
                Min: 250
                Max: 4000
              '';
            };
            ResolveNamesOnline = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Resolve names using online services.

                Type: Bool
              '';
            };
            ShowCatalog = mkOption {
              type = nullOr (either str (listOf int));
              default = "";
              description = ''
                List of toggles for displaying custom object catalogs.

                Type: IntList
              '';
            };
            ShowCatalogNames = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                List for displaying custom object catalogs.

                Type: StringList
              '';
            };
          };
        };
        default = { };
        description = "Catalogs";
      };
    "Colors" = with types;
      mkOption {
        type = submodule {
          options = {
            AngularRulerColor = mkOption {
              type = nullOr str;
              default = "#FFF";
              description = ''
                Color of angular distance ruler

                Type: String
              '';
            };
            ArtificialHorizonColor = mkOption {
              type = nullOr str;
              default = "#C82828";
              description = ''
                Color Artificial Horizon

                Type: String
              '';
            };
            BoxBGColor = mkOption {
              type = nullOr str;
              default = "#000";
              description = ''
                Background color of InfoBoxes

                Type: String
              '';
            };
            BoxGrabColor = mkOption {
              type = nullOr str;
              default = "#F00";
              description = ''
                Text color of InfoBoxes when grabbed with mouse

                Type: String
              '';
            };
            BoxTextColor = mkOption {
              type = nullOr str;
              default = "#FFF";
              description = ''
                Text color of InfoBoxes

                Type: String
              '';
            };
            CBoundColor = mkOption {
              type = nullOr str;
              default = "#222";
              description = ''
                Color of constellation boundaries

                Type: String
              '';
            };
            CBoundHighColor = mkOption {
              type = nullOr str;
              default = "#222";
              description = ''
                Color of highlighted constellation boundary

                Type: String
              '';
            };
            CLineColor = mkOption {
              type = nullOr str;
              default = "#555";
              description = ''
                Color of constellation lines

                Type: String
              '';
            };
            CNameColor = mkOption {
              type = nullOr str;
              default = "#AA7";
              description = ''
                Color of constellation names

                Type: String
              '';
            };
            ColorSchemeFile = mkOption {
              type = nullOr str;
              default = "moonless-night.colors";
              description = ''
                The name of the color scheme

                Type: String
              '';
            };
            CompassColor = mkOption {
              type = nullOr str;
              default = "#002";
              description = ''
                Color of cardinal compass labels along horizon

                Type: String
              '';
            };
            DEGuideColor = mkOption {
              type = nullOr str;
              default = "#00A5FF";
              description = ''
                Color of DEC Guide Error

                Type: String
              '';
            };
            DeepSkyNameColor = mkOption {
              type = nullOr str;
              default = "#7AA";
              description = ''
                Color of deep-sky object name labels

                Type: String
              '';
            };
            EclipticColor = mkOption {
              type = nullOr str;
              default = "#663";
              description = ''
                Color of ecliptic line

                Type: String
              '';
            };
            EquatorColor = mkOption {
              type = nullOr str;
              default = "#FFF";
              description = ''
                Color of equator line

                Type: String
              '';
            };
            EquatorialGridColor = mkOption {
              type = nullOr str;
              default = "#456";
              description = ''
                Color of equatorial coordinate grid lines

                Type: String
              '';
            };
            HorizonColor = mkOption {
              type = nullOr str;
              default = "#5A3";
              description = ''
                Color of horizon line

                Type: String
              '';
            };
            HorizontalGridColor = mkOption {
              type = nullOr str;
              default = "#5A3";
              description = ''
                Color of horizontal coordinate grid lines

                Type: String
              '';
            };
            LocalMeridianColor = mkOption {
              type = nullOr str;
              default = "#0059b3";
              description = ''
                Color of local meridian line

                Type: String
              '';
            };
            MilkyWayWColor = mkOption {
              type = nullOr str;
              default = "#123";
              description = ''
                Color of Milky Way contour

                Type: String
              '';
            };
            PlanetNameColor = mkOption {
              type = nullOr str;
              default = "#439";
              description = ''
                Color of planet name labels

                Type: String
              '';
            };
            PlanetTrailColor = mkOption {
              type = nullOr str;
              default = "#963";
              description = ''
                Color of planet trails

                Type: String
              '';
            };
            RAGuideColor = mkOption {
              type = nullOr str;
              default = "#00FF00";
              description = ''
                Color of RA Guide Error

                Type: String
              '';
            };
            SatColor = mkOption {
              type = nullOr str;
              default = "#FF0000";
              description = ''
                Color of invisible satellites

                Type: String
              '';
            };
            SatLabelColor = mkOption {
              type = nullOr str;
              default = "#640000";
              description = ''
                Color of satellites labels

                Type: String
              '';
            };
            SkyColor = mkOption {
              type = nullOr str;
              default = "#002";
              description = ''
                Color of sky

                Type: String
              '';
            };
            SolverFOVColor = mkOption {
              type = nullOr str;
              default = "#FFFF00";
              description = ''
                Color of solver FOV box

                Type: String
              '';
            };
            SpecialObjectColor = mkOption {
              type = nullOr str;
              default = "#A00";
              description = ''
                Color of objects with extra links available

                Type: String
              '';
            };
            StarColorIntensity = mkOption {
              type = nullOr (either str int);
              default = 6;
              description = ''
                Saturation level of star colors

                Type: UInt
                Max: 10
              '';
            };
            StarColorMode = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Mode for rendering stars

                Type: UInt
                Max: 4
              '';
            };
            StarNameColor = mkOption {
              type = nullOr str;
              default = "#7AA";
              description = ''
                Color of star name labels

                Type: String
              '';
            };
            SupernovaColor = mkOption {
              type = nullOr str;
              default = "#FFA500";
              description = ''
                Color of supernovae

                Type: String
              '';
            };
            TelescopeTargetColor = mkOption {
              type = nullOr str;
              default = "#8B8";
              description = ''
                Color of telescope symbols

                Type: String
              '';
            };
            UserLabelColor = mkOption {
              type = nullOr str;
              default = "#439";
              description = ''
                Color of user-added labels

                Type: String
              '';
            };
            VisibleSatColor = mkOption {
              type = nullOr str;
              default = "#00FF00";
              description = ''
                Color of visible satellites

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Colors";
      };
    "DarkLibrary" = with types;
      mkOption {
        type = submodule {
          options = {
            MaxDarkTemperatureDiff = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Maximum acceptable difference between current and recorded dark frame temperature set point. When the difference exceeds this value, a new dark frame shall be captured for this set point.

                Type: Double
              '';
            };
            shutterfulCCDs = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                List of CCDs with mechanical or electronic shutters.

                Type: StringList
              '';
            };
            shutterlessCCDs = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                List of CCDs without mechanical or electronic shutters.

                Type: StringList
              '';
            };
          };
        };
        default = { };
        description = "DarkLibrary";
      };
    "Ekos" = with types;
      mkOption {
        type = submodule {
          options = {
            AutoStartEkosLive = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Start Ekos Live on KStars startup.

                Type: Bool
              '';
            };
            EkosLeftIcons = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Ekos modules icons are placed to the left of pages

                Type: Bool
              '';
            };
            EkosLiveOnline = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether EkosLive connection mode is online.

                Type: Bool
              '';
            };
            EkosLiveUsername = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                EkosLive username

                Type: String
              '';
            };
            EkosTopIcons = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Ekos modules icons are placed on the top of pages

                Type: Bool
              '';
            };
            EkosWindowHeight = mkOption {
              type = nullOr (either str int);
              default = 600;
              description = ''
                Ekos window height

                Type: UInt
              '';
            };
            EkosWindowWidth = mkOption {
              type = nullOr (either str int);
              default = 600;
              description = ''
                Ekos window width

                Type: UInt
              '';
            };
            RememberCredentials = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Remember Ekos Live credentials.

                Type: Bool
              '';
            };
            autoLoadSerialAssistant = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically load Serial Port Assistant tool when detecting unmapped serial ports?

                Type: Bool
              '';
            };
            independentWindowEkos = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Make Ekos window independent of KStars main window

                Type: Bool
              '';
            };
            loadConfigOnConnection = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Load device configuration upon successful connection?

                Type: Bool
              '';
            };
            loadDefaultConfig = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Always load device default configuration upon successful connection?

                Type: Bool
              '';
            };
            neverLoadConfig = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Never load device configuration?

                Type: Bool
              '';
            };
            profile = mkOption {
              type = nullOr str;
              default = "Simulators";
              description = ''
                Ekos drivers profile

                Type: String
              '';
            };
          };
        };
        default = { };
        description = "Ekos";
      };
    "FITSViewer" = with types;
      mkOption {
        type = submodule {
          options = {
            Auto3DCube = mkOption {
              type = nullOr (either str bool);
              default = "!KSUtils::isHardwareLimited()";
              description = ''
                Process 3D FITS Cube (RGB). If false, only first channel is processed.

                Type: Bool
              '';
            };
            AutoDebayer = mkOption {
              type = nullOr (either str bool);
              default = "!KSUtils::isHardwareLimited()";
              description = ''
                Automatically debayer a FITS image if it is contains a bayer pattern

                Type: Bool
              '';
            };
            AutoHFR = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically compute HFRs of fits images

                Type: Bool
              '';
            };
            AutoWCS = mkOption {
              type = nullOr (either str bool);
              default = "!KSUtils::isHardwareLimited()";
              description = ''
                Automatically process World-Coordinate-System (WCS) data when loading a FITS file.

                Type: Bool
              '';
            };
            LimitedResourcesMode = mkOption {
              type = nullOr (either str bool);
              default = "KSUtils::isHardwareLimited()";
              description = ''
                Conserve CPU and memory by disabling all resource-intensive features in FITS Viewer

                Type: Bool
              '';
            };
            NonLinearHistogram = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Create histogram from non-linear auto-stretched image rather than linear raw image data.

                Type: Bool
              '';
            };
            QuickHFR = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Compute the HFRs of normal images quickly by looking at the center 25% only.

                Type: Bool
              '';
            };
            StellarSolverPartition = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable StellarSolver partition. Partitions the image in multiple threads to speed up detecting stars. This may significantly speed up source extraction but may result in unstable operation.

                Type: Bool
              '';
            };
            focusFITSOnNewImage = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            independentWindowFITS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Make FITS Viewer window independent of KStars main window

                Type: Bool
              '';
            };
            singlePreviewFITS = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Preview FITS in a single tab?

                Type: Bool
              '';
            };
            singleWindowCapturedFITS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display all captured FITS in one window?

                Type: Bool
              '';
            };
            singleWindowOpenedFITS = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display all opened FITS in one window?

                Type: Bool
              '';
            };
            useFITSViewer = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display every image captured in a FITS Viewer window.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "FITSViewer";
      };
    "Focus" = with types;
      mkOption {
        type = submodule {
          options = {
            DefaultFocusTemperatureSource = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default focus module temperature source.

                Type: String
              '';
            };
            FocusAlgorithm = mkOption {
              type = nullOr str;
              default = "Linear 1 Pass";
              description = ''
                Focus process algorithm

                Type: String
              '';
            };
            FocusAutoStarEnabled = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically select a star to focus.

                Type: Bool
              '';
            };
            FocusBacklash = mkOption {
              type = nullOr str;
              default = "0";
              description = ''
                Focus backlash in steps. Zero disables backlash compensation.

                Type: String
              '';
            };
            FocusBinning = mkOption {
              type = nullOr str;
              default = "1x1";
              description = ''
                Default Camera binning

                Type: String
              '';
            };
            FocusBoxSize = mkOption {
              type = nullOr (either str int);
              default = 64;
              description = ''
                Default Focuser star selection box size

                Type: UInt
              '';
            };
            FocusCaptureTimeout = mkOption {
              type = nullOr (either str int);
              default = 120;
              description = ''


                Type: UInt
              '';
            };
            FocusCurveFit = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Curve Type.

                Type: UInt
              '';
            };
            FocusDetection = mkOption {
              type = nullOr str;
              default = "SEP";
              description = ''
                Star detection algorithm

                Type: String
              '';
            };
            FocusExposure = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Default focus exposure time when no filters are used.

                Type: double
              '';
            };
            FocusFilter = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default Filter Wheel filter

                Type: String
              '';
            };
            FocusFramesCount = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Number of focus frames to average for HFR calculations.

                Type: UInt
              '';
            };
            FocusFullFieldInnerRadius = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Full field inner radius.

                Type: Double
              '';
            };
            FocusFullFieldOuterRadius = mkOption {
              type = nullOr (either str float);
              default = 100.0;
              description = ''
                Full field outer radius.

                Type: Double
              '';
            };
            FocusGain = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default Focuser gain value

                Type: Double
              '';
            };
            FocusGaussianKernelSize = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''
                Gaussian blur kernel size.

                Type: Int
              '';
            };
            FocusGaussianSigma = mkOption {
              type = nullOr (either str float);
              default = 1.5;
              description = ''
                Gaussian blur sigma value.

                Type: Double
              '';
            };
            FocusISO = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default Focuser Camera ISO value

                Type: String
              '';
            };
            FocusMaxSingleStep = mkOption {
              type = nullOr (either str int);
              default = 2000;
              description = ''
                Maximum single step the focus algorithm is permitted to command.

                Type: UInt
              '';
            };
            FocusMaxTravel = mkOption {
              type = nullOr (either str int);
              default = 5000;
              description = ''
                Maximum Focus Travel Distance

                Type: UInt
              '';
            };
            FocusMotionTimeout = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''


                Type: UInt
              '';
            };
            FocusMultiRowAverage = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''
                Number of rows to combine in the Bahtinov average calculation.

                Type: Int
              '';
            };
            FocusOutSteps = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Initial Focus Out Steps

                Type: Double
              '';
            };
            FocusR2Limit = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Acceptable limit on R2 from curve fit.

                Type: Double
              '';
            };
            FocusSEPProfile = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Focus source extraction profile

                Type: String
              '';
            };
            FocusSettleTime = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            FocusSubFrame = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Subframe the focus star during the autofocus procedure.

                Type: Bool
              '';
            };
            FocusSuspendGuiding = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Suspend guiding while autofocus in progress.

                Type: Bool
              '';
            };
            FocusThreshold = mkOption {
              type = nullOr (either str float);
              default = 150.0;
              description = ''
                Relative percentage strength of centroid edge pixel strength to average pixel value.

                Type: Double
              '';
            };
            FocusTicks = mkOption {
              type = nullOr (either str int);
              default = 500;
              description = ''
                Default Focuser step ticks

                Type: UInt
              '';
            };
            FocusTolerance = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Default Focuser tolerance value

                Type: Double
              '';
            };
            FocusUseFullField = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Measure average HFR from all stars combined in a full frame. This method defaults to the Centroid detection, but can use SEP detection too. Its performance decreases as the number of stars increases.

                Type: Bool
              '';
            };
            FocusUseWeights = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use weights in the curve fitting process.

                Type: Bool
              '';
            };
            GuideSettleTime = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            UseFocusDarkFrame = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Take a dark frame and subtract it before running autofocus operation.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Focus";
      };
    "GUI" = with types;
      mkOption {
        type = submodule {
          options = {
            CurrentTheme = mkOption {
              type = nullOr str;
              default = "Default";
              description = ''
                Current application theme

                Type: String
              '';
            };
            PositionFocusBox = mkOption {
              type = nullOr str;
              default = "QPoint(600,0)";
              defaultText = "Code: true";
              description = ''
                Position of the focus InfoBox.

                Type: Point
              '';
            };
            PositionGeoBox = mkOption {
              type = nullOr str;
              default = "QPoint(0,600)";
              defaultText = "Code: true";
              description = ''
                Position of the geographic InfoBox.

                Type: Point
              '';
            };
            PositionTimeBox = mkOption {
              type = nullOr str;
              default = "QPoint(0,0)";
              defaultText = "Code: true";
              description = ''
                Position of the time InfoBox.

                Type: Point
              '';
            };
            RunStartupWizard = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Run Startup Wizard when KStars launches?

                Type: Bool
              '';
            };
            ShadeFocusBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Is the focus InfoBox in the "shaded" state?

                Type: Bool
              '';
            };
            ShadeGeoBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Is the geographic InfoBox in the "shaded" state?

                Type: Bool
              '';
            };
            ShadeTimeBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Is the time InfoBox in the "shaded" state?

                Type: Bool
              '';
            };
            ShowAltAzField = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display Alt/Az coordinates in the statusbar?

                Type: Bool
              '';
            };
            ShowFocusBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the focus InfoBox?

                Type: Bool
              '';
            };
            ShowGeoBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the geographic InfoBox?

                Type: Bool
              '';
            };
            ShowInfoBoxes = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Meta-option to toggle display of all InfoBoxes

                Type: Bool
              '';
            };
            ShowJ2000RADecField = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display J2000.0 RA/Dec coordinates in the statusbar?

                Type: Bool
              '';
            };
            ShowRADecField = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display RA/Dec coordinates in the statusbar?

                Type: Bool
              '';
            };
            ShowSensorFOV = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display CCD sensor angular size on the sky map?

                Type: Bool
              '';
            };
            ShowStatusBar = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the statusbar?

                Type: Bool
              '';
            };
            ShowTimeBox = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the time InfoBox?

                Type: Bool
              '';
            };
            StickyFocusBox = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Time InfoBox anchor flag

                Type: Int
                Min: 0
                Max: 3
              '';
            };
            StickyGeoBox = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                Geographic InfoBox anchor flag

                Type: Int
                Min: 0
                Max: 3
              '';
            };
            StickyTimeBox = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Time InfoBox anchor flag

                Type: Int
                Min: 0
                Max: 3
              '';
            };
            WindowHeight = mkOption {
              type = nullOr (either str int);
              default = 768;
              description = ''
                Height of main window, in pixels

                Type: UInt
              '';
            };
            WindowWidth = mkOption {
              type = nullOr (either str int);
              default = 1024;
              description = ''
                Width of main window, in pixels

                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "GUI";
      };
    "General" = with types;
      mkOption {
        type = submodule {
          options = {
            AlignmentLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            AlwaysRecomputeCoordinates = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Always recompute coordinates

                Type: Bool
              '';
            };
            CaptureLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            DSSPadding = mkOption {
              type = nullOr (either str float);
              default = 10.0;
              description = ''
                Additional padding around DSS Images of deep-sky objects

                Type: Double
              '';
            };
            DefaultDSSImageSize = mkOption {
              type = nullOr (either str float);
              default = 15.0;
              description = ''
                Default size for DSS images

                Type: Double
              '';
            };
            DisableLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Disable Verbose Logging

                Type: Bool
              '';
            };
            FITSLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            FocusLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            GuideLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            INDILogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            KStarsFirstRun = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Is this the first time running KStars?

                Type: Bool
              '';
            };
            LogToDefault = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Log debug message to default output

                Type: Bool
              '';
            };
            LogToFile = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Log debug message to a log file

                Type: Bool
              '';
            };
            MountLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            ObservatoryLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            RegularLogging = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable Regular Logging

                Type: Bool
              '';
            };
            SaveGuideImages = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Save Internal Guider images on disk?

                Type: Bool
              '';
            };
            VerboseLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable Verbose Logging

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "General";
      };
    "Guide" = with types;
      mkOption {
        type = submodule {
          options = {
            AutoModeIterations = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''
                Number of automode iterations for calibration process.

                Type: UInt
              '';
            };
            CalibrationMaxMove = mkOption {
              type = nullOr (either str int);
              default = 15;
              description = ''
                Maximum number of pixels the calibration should move (approximate).

                Type: UInt
              '';
            };
            CalibrationPulseDuration = mkOption {
              type = nullOr (either str int);
              default = 1000;
              description = ''
                Pulse duration in milliseconds used for guiding pulses during calibration stage.

                Type: UInt
              '';
            };
            DECGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable autoguiding in the DEC axis.

                Type: Bool
              '';
            };
            DECIntegralGain = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            DECMaximumPulseArcSec = mkOption {
              type = nullOr (either str int);
              default = 25;
              description = ''


                Type: UInt
              '';
            };
            DECMinimumPulseArcSec = mkOption {
              type = nullOr (either str float);
              default = 0.2;
              description = ''


                Type: Double
              '';
            };
            DECProportionalGain = mkOption {
              type = nullOr (either str float);
              default = 133.33;
              description = ''


                Type: Double
              '';
            };
            DECorrDisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display the DEC Corrections Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            DEDisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the DEC Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            DitherEnabled = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use Auto Dithering when guiding.

                Type: Bool
              '';
            };
            DitherFailAbortsAutoGuide = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                If dithering fails then abort autoguide.

                Type: Bool
              '';
            };
            DitherFrames = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Dither after this many frames.

                Type: UInt
              '';
            };
            DitherMaxIterations = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''
                How many dithering attempts to undertake before giving up.

                Type: UInt
              '';
            };
            DitherNoGuiding = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Perform dithering even when not guiding.

                Type: Bool
              '';
            };
            DitherNoGuidingPulse = mkOption {
              type = nullOr (either str int);
              default = 500;
              description = ''
                Pulse length in milliseconds used for non-guiding dither.

                Type: UInt
              '';
            };
            DitherPixels = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                How many pixels to move between subsequent exposures under auto dithering mode.

                Type: Double
              '';
            };
            DitherSettle = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                After dither is successful, wait for this many seconds before proceeding.

                Type: UInt
              '';
            };
            DitherThreshold = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Maximum distance (pixels) for guiding to be considered settled.

                Type: Double
              '';
            };
            DitherTimeout = mkOption {
              type = nullOr (either str int);
              default = 45;
              description = ''
                Time limit (seconds) on dithering to settle down.

                Type: UInt
              '';
            };
            DitherWithOnePulse = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Dithering amount is randomly generated, pulses are sent, but the resultant pixel dithering amount is not enforced, so only the one dither pulse is sent. This is quicker, and recommended as dither amount is random anyway. It is necessary when 2-D dither is required but guiding is only done in one axis.

                Type: Bool
              '';
            };
            EastRAGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable East autoguiding in the RA axis.

                Type: Bool
              '';
            };
            GPGDarkGuiding = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            GPGDarkGuidingInterval = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''


                Type: Double
              '';
            };
            GPGEnabled = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            GPGEstimatePeriod = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            GPGMinMove = mkOption {
              type = nullOr (either str float);
              default = 0.2;
              description = ''


                Type: Double
              '';
            };
            GPGMinPeriodsForInference = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''


                Type: UInt
              '';
            };
            GPGMinPeriodsForPeriodEstimate = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''


                Type: UInt
              '';
            };
            GPGPKLengthScale = mkOption {
              type = nullOr (either str float);
              default = 10.0;
              description = ''


                Type: Double
              '';
            };
            GPGPKSignalVariance = mkOption {
              type = nullOr (either str float);
              default = 20.0;
              description = ''


                Type: Double
              '';
            };
            GPGPeriod = mkOption {
              type = nullOr (either str float);
              default = 480.0;
              description = ''


                Type: Double
              '';
            };
            GPGPointsForApproximation = mkOption {
              type = nullOr (either str int);
              default = 100;
              description = ''


                Type: UInt
              '';
            };
            GPGSE0KLengthScale = mkOption {
              type = nullOr (either str int);
              default = 700;
              description = ''


                Type: UInt
              '';
            };
            GPGSE0KSignalVariance = mkOption {
              type = nullOr (either str float);
              default = 20.0;
              description = ''


                Type: Double
              '';
            };
            GPGSE1KLengthScale = mkOption {
              type = nullOr (either str float);
              default = 25.0;
              description = ''


                Type: Double
              '';
            };
            GPGSE1KSignalVariance = mkOption {
              type = nullOr (either str float);
              default = 10.0;
              description = ''


                Type: Double
              '';
            };
            GPGcWeight = mkOption {
              type = nullOr (either str float);
              default = 0.6;
              description = ''


                Type: Double
              '';
            };
            GPGpWeight = mkOption {
              type = nullOr (either str float);
              default = 0.5;
              description = ''


                Type: Double
              '';
            };
            GuideAlgorithm = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''
                Which Algorithm to use track guide square (0 smart, 1 SEP, 2 fast, 3 threshold, 4 no threshold, 5 SEP multistar).

                Type: UInt
              '';
            };
            GuideAutoSquareSizeEnabled = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically select the square size based on the selected star width.

                Type: Bool
              '';
            };
            GuideAutoStar = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically select calibration star and perform calibration.

                Type: Bool
              '';
            };
            GuideBinning = mkOption {
              type = nullOr str;
              default = "2x2";
              description = ''
                Guide binning.

                Type: String
              '';
            };
            GuideCalibrationTimeout = mkOption {
              type = nullOr (either str int);
              default = 600;
              description = ''
                When calibration starts, wait this many seconds before aborting.

                Type: UInt
              '';
            };
            GuideDarkFrame = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Take dark frame for autoguider images.

                Type: Bool
              '';
            };
            GuideDelay = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Delay next exposure by this many seconds.

                Type: Double
              '';
            };
            GuideExposure = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Guider exposure duration in seconds.

                Type: Double
              '';
            };
            GuideLostStarTimeout = mkOption {
              type = nullOr (either str int);
              default = 60;
              description = ''
                When star tracking is lost, wait this many seconds before aborting.

                Type: UInt
              '';
            };
            GuideMaxDeltaRMS = mkOption {
              type = nullOr (either str float);
              default = 10.0;
              description = ''
                Maximum delta RMS permitted while guiding before aborting.

                Type: Double
              '';
            };
            GuideMaxHFR = mkOption {
              type = nullOr (either str float);
              default = 4.5;
              description = ''
                Maximum HFR permitted for SEP MultiStar guide star.

                Type: Double
              '';
            };
            GuideSquareSize = mkOption {
              type = nullOr str;
              default = "32";
              description = ''
                Guide square size selection in pixels.

                Type: String
              '';
            };
            GuideSubframe = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Subframe guide image around selected region

                Type: Bool
              '';
            };
            GuiderAccuracyThreshold = mkOption {
              type = nullOr (either str int);
              default = 2;
              description = ''
                Accuracy threshold for the Guide Graphs.

                Type: UInt
              '';
            };
            GuiderType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Which guider process to utilize for guiding (0 Internal Guider, 1 PHD2, 2 lin_guider)

                Type: UInt
              '';
            };
            LinGuiderHost = mkOption {
              type = nullOr str;
              default = "localhost";
              description = ''
                Host name of external lin_guider service

                Type: String
              '';
            };
            LinGuiderPort = mkOption {
              type = nullOr (either str int);
              default = 5656;
              description = ''
                Lin_guider Event Monitoring Port

                Type: UInt
              '';
            };
            MaxMultistarReferenceStars = mkOption {
              type = nullOr (either str int);
              default = 10;
              description = ''
                Maximum number of SEP MultiStar number of stars used as references.

                Type: UInt
              '';
            };
            MinDetectionsSEPMultistar = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Minimum number of stars detected for SEP MultiStar to initialize.

                Type: UInt
              '';
            };
            NorthDECGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable North autoguiding in the DEC axis.

                Type: Bool
              '';
            };
            PHD2Host = mkOption {
              type = nullOr str;
              default = "localhost";
              description = ''
                Host name of external PHD2 service

                Type: String
              '';
            };
            PHD2Port = mkOption {
              type = nullOr (either str int);
              default = 4400;
              description = ''
                PHD2 Event Monitoring Port

                Type: UInt
              '';
            };
            RACorrDisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Display the RA Corrections Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            RADisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the RA Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            RAGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable autoguiding in the RA axis.

                Type: Bool
              '';
            };
            RAIntegralGain = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''


                Type: Double
              '';
            };
            RAMaximumPulseArcSec = mkOption {
              type = nullOr (either str int);
              default = 25;
              description = ''


                Type: UInt
              '';
            };
            RAMinimumPulseArcSec = mkOption {
              type = nullOr (either str float);
              default = 0.2;
              description = ''


                Type: Double
              '';
            };
            RAProportionalGain = mkOption {
              type = nullOr (either str float);
              default = 133.33;
              description = ''


                Type: Double
              '';
            };
            RMSDisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the RMS Error Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            SNRDisplayedOnGuideGraph = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display the SNR Plot on the Guide Drift Graphics.

                Type: Bool
              '';
            };
            SaveGuideLog = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically save internal guider user logs.

                Type: Bool
              '';
            };
            SouthDECGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable South autoguiding in the DEC axis.

                Type: Bool
              '';
            };
            TwoAxisEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use both axes to perform calibration.

                Type: Bool
              '';
            };
            UseGuideHead = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use the guider chip for guiding from cameras that have a dedicated guider chip.

                Type: Bool
              '';
            };
            WestRAGuideEnabled = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Enable West autoguiding in the RA axis.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Guide";
      };
    "HIPS" = with types;
      mkOption {
        type = submodule {
          options = {
            HIPSBiLinearInterpolation = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use Bilinear interpolation when rendering HiPS images?

                Type: Bool
              '';
            };
            HIPSMemoryCache = mkOption {
              type = nullOr (either str int);
              default = 300;
              description = ''
                RAM cache size in MB used to store cached HIPS images.

                Type: UInt
              '';
            };
            HIPSNetCache = mkOption {
              type = nullOr (either str int);
              default = 1000;
              description = ''
                Hard disk cache size in MB used to store cached HIPS images.

                Type: UInt
              '';
            };
            HIPSOfflinePath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                HIPS offline full path.

                Type: String
              '';
            };
            HIPSPanning = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Redraw HiPS while panning.

                Type: Bool
              '';
            };
            HIPSShowGrid = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show HiPS grid on the sky map.

                Type: Bool
              '';
            };
            HIPSSource = mkOption {
              type = nullOr str;
              default = "None";
              description = ''
                HIPS source catalog title.

                Type: String
              '';
            };
            HIPSUseOfflineSource = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use offline storage to load HiPS?

                Type: Bool
              '';
            };
            ShowHIPS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw HiPS sources in the sky map?

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "HIPS";
      };
    "INDI Lite" = with types;
      mkOption {
        type = submodule {
          options = {
            LastServer = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                The address of last used server

                Type: String
              '';
            };
            LastServerPort = mkOption {
              type = nullOr (either str int);
              default = 7624;
              description = ''
                The port of last used server

                Type: UInt
              '';
            };
            LastWebManagerPort = mkOption {
              type = nullOr (either str int);
              default = 8624;
              description = ''
                The port of last used Web Manager

                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "INDI Lite";
      };
    "Location" = with types;
      mkOption {
        type = submodule {
          options = {
            CityName = mkOption {
              type = nullOr str;
              default = "Greenwich";
              description = ''
                City name of geographic location.

                Type: String
              '';
            };
            CountryName = mkOption {
              type = nullOr str;
              default = "United Kingdom";
              description = ''
                Country name of geographic location.

                Type: String
              '';
            };
            DST = mkOption {
              type = nullOr str;
              default = "--";
              description = ''
                Two-letter code for daylight savings time rule used by geographic location.

                Type: String
              '';
            };
            Elevation = mkOption {
              type = nullOr (either str float);
              default = -10.0;
              description = ''
                Elevation above sea level of geographic location, in meters.

                Type: Double
              '';
            };
            Latitude = mkOption {
              type = nullOr (either str float);
              default = 51.468;
              description = ''
                Geographic Latitude, in degrees.

                Type: Double
              '';
            };
            Longitude = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Geographic Longitude, in degrees.

                Type: Double
              '';
            };
            ProvinceName = mkOption {
              type = nullOr str;
              default = " ";
              description = ''
                Province name of geographic location.

                Type: String
              '';
            };
            TimeZone = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Time Zone offset of geographic location, in hours.

                Type: Double
              '';
            };
          };
        };
        default = { };
        description = "Location";
      };
    "Manager" = with types;
      mkOption {
        type = submodule {
          options = {
            UseGraphicalCountsDisplay = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use the graphical version for capture/sequence/total counting using round progress bars.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Manager";
      };
    "Mosaic" = with types;
      mkOption {
        type = submodule {
          options = {
            MosaicTransparencyAuto = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''


                Type: Bool
              '';
            };
            MosaicTransparencyLevel = mkOption {
              type = nullOr (either str float);
              default = 50.0;
              description = ''


                Type: Double
              '';
            };
          };
        };
        default = { };
        description = "Mosaic";
      };
    "Mount" = with types;
      mkOption {
        type = submodule {
          options = {
            ConfirmBelowHorizon = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Warn user before command mount to go to a target below horizon.

                Type: Bool
              '';
            };
            EnableAltitudeLimits = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable mount altitude limits.

                Type: Bool
              '';
            };
            EnableHaLimit = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable mount hour angle limit.

                Type: Bool
              '';
            };
            ExecuteMeridianFlip = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Flips the mount when reaching the meridian, if supported.

                Type: Bool
              '';
            };
            LeftRightReversed = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Reverse the direction of right and left buttons in mount control.

                Type: Bool
              '';
            };
            MaximumAltLimit = mkOption {
              type = nullOr (either str float);
              default = 90.0;
              description = ''
                Default maximum mount altitude limit.

                Type: Double
              '';
            };
            MaximumHaLimit = mkOption {
              type = nullOr (either str float);
              default = 90.0;
              description = ''
                Default maximum limit for the hour angle.

                Type: Double
              '';
            };
            MeridianFlipOffsetDegrees = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Default hour angle to perform meridian flip in degrees.

                Type: Double
              '';
            };
            MinimumAltLimit = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default minimum mount altitude limit

                Type: Double
              '';
            };
            ParkEveryDay = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Automatically start parking timer on startup.

                Type: Bool
              '';
            };
            ParkTime = mkOption {
              type = nullOr str;
              default = "3:00 AM";
              description = ''
                Park mount at this time in 12 hour format.

                Type: String
              '';
            };
            UpDownReversed = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Reverse the direction of up and down buttons in mount control.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Mount";
      };
    "Observatory" = with types;
      mkOption {
        type = submodule {
          options = {
            DefaultObservatoryWeatherSource = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Default observatory module weather source.

                Type: String
              '';
            };
            alertActionsActive = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Will be reacted upon alerts?

                Type: Bool
              '';
            };
            observatoryStatusUseDome = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Dome status relevant for the Observatory status.

                Type: Bool
              '';
            };
            observatoryStatusUseShutter = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Shutter status relevant for the Observatory status.

                Type: Bool
              '';
            };
            observatoryStatusUseWeather = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Weather status relevant for the Observatory status.

                Type: Bool
              '';
            };
            warningActionsActive = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Will be reacted upon warnings?

                Type: Bool
              '';
            };
            weatherAlertCloseDome = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Shall the dome being closed when a weather alert occurs?

                Type: Bool
              '';
            };
            weatherAlertCloseShutter = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Shall the shutter being closed when a weather alert occurs?

                Type: Bool
              '';
            };
            weatherAlertDelay = mkOption {
              type = nullOr (either str int);
              default = 30;
              description = ''
                Delay for reacting upon a weather alert.

                Type: UInt
              '';
            };
            weatherAlertStopScheduler = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Shall the shutter being closed when a weather alert occurs?

                Type: Bool
              '';
            };
            weatherAutoScaleValues = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Scale the sensor graph value axis to the values range.

                Type: Bool
              '';
            };
            weatherWarningCloseDome = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Shall the dome being closed when a weather warning occurs?

                Type: Bool
              '';
            };
            weatherWarningCloseShutter = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Shall the shutter being closed when a weather warning occurs?

                Type: Bool
              '';
            };
            weatherWarningDelay = mkOption {
              type = nullOr (either str int);
              default = 600;
              description = ''
                Delay for reacting upon a weather warning.

                Type: UInt
              '';
            };
            weatherWarningStopScheduler = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Shall the shutter being closed when a weather alert occurs?

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Observatory";
      };
    "ObservingList" = with types;
      mkOption {
        type = submodule {
          options = {
            ObsListCoverage = mkOption {
              type = nullOr (either str float);
              default = 40.0;
              description = ''
                The object must obey the minimum and maximum altitudes at least this much percentage of the indicated time range.

                Type: Double
              '';
            };
            ObsListDemoteHole = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                While sorting by percentage altitude in the observing list, demote objects present in the Dobsonian hole

                Type: Bool
              '';
            };
            ObsListHoleSize = mkOption {
              type = nullOr (either str float);
              default = 15.0;
              description = ''
                This is the angular distance from the zenith, in degrees, below which you can easily point your telescope.

                Type: Double
              '';
            };
            ObsListPreferDSS = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Prefer Digitized Sky Survey imagery in the observing list

                Type: Bool
              '';
            };
            ObsListPreferSDSS = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Prefer Sloan Digital Sky Survey imagery in the observing list

                Type: Bool
              '';
            };
            ObsListSymbol = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use symbols to label observing list objects

                Type: Bool
              '';
            };
            ObsListText = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use text to label observing list objects

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "ObservingList";
      };
    "Satellites" = with types;
      mkOption {
        type = submodule {
          options = {
            DrawSatellitesLikeStars = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                If selected, satellites will be draw like stars, otherwise, draw satellites as small colored square.

                Type: Bool
              '';
            };
            SelectedSatellites = mkOption {
              type = nullOr (either str (listOf str));
              default = "";
              description = ''
                Selected satellites.

                Type: StringList
              '';
            };
            ShowSatellites = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw satellites in the sky map?

                Type: Bool
              '';
            };
            ShowSatellitesLabels = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw satellite labels?

                Type: Bool
              '';
            };
            ShowVisibleSatellites = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw only visible satellites in the sky map

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Satellites";
      };
    "Scheduler" = with types;
      mkOption {
        type = submodule {
          options = {
            AlignCheckFrequency = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                When calculating position after captures, compute it every Nth capture. Set to 0 to disable.

                Type: UInt
              '';
            };
            AlignCheckThreshold = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''
                If captured position exceeds target position by more this many arcminutes, abort capture and reschedule the pipeline.

                Type: Double
              '';
            };
            CameraHeight = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Camera Height in pixels.

                Type: UInt
              '';
            };
            CameraPixelHeight = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Camera pixel size height in micrometers.

                Type: Double
              '';
            };
            CameraPixelWidth = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Camera pixel size width in micrometers.

                Type: Double
              '';
            };
            CameraRotation = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Position angle of the camera with respect to north.

                Type: Double
              '';
            };
            CameraWidth = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Camera Width in pixels.

                Type: UInt
              '';
            };
            DawnOffset = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Offset astronomical dawn by this many hours to relax twilight restriction when using narrowband filters.

                Type: Double
              '';
            };
            DuskOffset = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Offset astronomical dusk by this many hours to relax twilight restriction when using narrowband filters.

                Type: Double
              '';
            };
            ErrorHandlingStrategy = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Strategy how to react, when a job aborts or steps into an error.

                Type: UInt
              '';
            };
            ErrorHandlingStrategyDelay = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Delay in minutes how long the scheduler should pause before restarting an aborted job or a job that ran into an error.

                Type: UInt
              '';
            };
            ForceAlignmentBeforeJob = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Force alignment before starting or restarting each job.

                Type: Bool
              '';
            };
            GuideCalibrationBacklash = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Remove DEC backlash when calibrating guider.

                Type: Bool
              '';
            };
            LeadTime = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Minimum time between jobs in minutes.

                Type: Double
              '';
            };
            PreDawnTime = mkOption {
              type = nullOr (either str float);
              default = 30.0;
              description = ''
                Do not permit jobs to be scheduled or executed past this many minutes before dawn.

                Type: Double
              '';
            };
            PreemptiveShutdown = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Perform pre-emptive shutdown if no jobs are due for a number of hours.

                Type: Bool
              '';
            };
            PreemptiveShutdownTime = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Maximum number of hours before the next job is due to trigger a pre-emptive shutdown.

                Type: Double
              '';
            };
            RealignAfterCalibrationFailure = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                If guiding calibration fails, run alignment process again before proceeding to recalibration.

                Type: Bool
              '';
            };
            RememberJobProgress = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                When processing a scheduled job, resume the sequence starting from the last image present in storage.

                Type: Bool
              '';
            };
            RescheduleErrors = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Re-schedule jobs that ran into errors.

                Type: Bool
              '';
            };
            ResetGuideCalibration = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Always Reset guiding calibration before starting each job.

                Type: Bool
              '';
            };
            ResetMountModelBeforeJob = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Reset mount model before starting each job.

                Type: Bool
              '';
            };
            ResetMountModelOnAlignFail = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Reset mount model in case of alignment failure.

                Type: Bool
              '';
            };
            ReuseGuideCalibration = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Guider may re-use guiding calibration if one is available.

                Type: Bool
              '';
            };
            ReverseDecOnPierSideChange = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Reverse DEC on pier-side change when reusing calibration.

                Type: Bool
              '';
            };
            SchedulerAlgorithm = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Scheduler algorithm

                Type: UInt
              '';
            };
            SchedulerAlignStep = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for aligning on job startup.

                Type: Bool
              '';
            };
            SchedulerAltitude = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for job altitude constraints.

                Type: Bool
              '';
            };
            SchedulerAltitudeValue = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default scheduler job altitude constraint.

                Type: Double
              '';
            };
            SchedulerCloseDustCover = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for closing dust cover on shutdown.

                Type: Bool
              '';
            };
            SchedulerFocusStep = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for running autofocus on job startup.

                Type: Bool
              '';
            };
            SchedulerGuideStep = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for starting guiding on job startup.

                Type: Bool
              '';
            };
            SchedulerHorizon = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for job artificial horizon constraints.

                Type: Bool
              '';
            };
            SchedulerLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''


                Type: Bool
              '';
            };
            SchedulerMoonSeparation = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for job moon separation constraints.

                Type: Bool
              '';
            };
            SchedulerMoonSeparationValue = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Default scheduler job moon separation constraint.

                Type: Double
              '';
            };
            SchedulerOpenDustCover = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for opening dust cover on startup.

                Type: Bool
              '';
            };
            SchedulerParkDome = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for parking dome on shutdown.

                Type: Bool
              '';
            };
            SchedulerParkMount = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for parking mount on shutdown.

                Type: Bool
              '';
            };
            SchedulerTrackStep = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for starting mount tracking on job startup.

                Type: Bool
              '';
            };
            SchedulerTwilight = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Default scheduler checkbox for job twilight constraints.

                Type: Bool
              '';
            };
            SchedulerUnparkDome = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for unparking dome on startup.

                Type: Bool
              '';
            };
            SchedulerUnparkMount = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for unparking mount on startup.

                Type: Bool
              '';
            };
            SchedulerWarmCCD = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for warming the CCD on shutdown.

                Type: Bool
              '';
            };
            SchedulerWeather = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Default scheduler checkbox for job weather constraints.

                Type: Bool
              '';
            };
            SerializedCalibration = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Last Calibration serialized.

                Type: String
              '';
            };
            SettingAltitudeCutoff = mkOption {
              type = nullOr (either str float);
              default = 3.0;
              description = ''
                Do not permit jobs to be scheduled less than this many degrees before the altitude restriction. Actual execution proceeds until the altitude limit.

                Type: Double
              '';
            };
            ShutdownScriptTerminatesINDI = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Whether shutdown script, if exists, terminates INDI server in the process.

                Type: Bool
              '';
            };
            StopEkosAfterShutdown = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                After shutdown procedure is successfully executed, shutdown INDI and Ekos.

                Type: Bool
              '';
            };
            TelescopeFocalLength = mkOption {
              type = nullOr (either str float);
              default = 0.0;
              description = ''
                Telescope focal length in millimeters.

                Type: Double
              '';
            };
          };
        };
        default = { };
        description = "Scheduler";
      };
    "StellarSolver" = with types;
      mkOption {
        type = submodule {
          options = {
            AstrometryIndexFolderList = mkOption {
              type = nullOr (either str (listOf str));
              default = "KSUtils::getAstrometryDefaultIndexFolderPaths()";
              defaultText = "Code: true";
              description = ''
                List of index folder paths.

                Type: StringList
              '';
            };
            AstrometryLogFilepath = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("AstrometryLogFilepath")'';
              defaultText = "Code: true";
              description = ''
                Path of the log file to save astrometry logging to.

                Type: String
              '';
            };
            AstrometryLogToFile = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Whether to log to a file instead.

                Type: Bool
              '';
            };
            FocusOptionsProfile = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Options Profile for Sextraction when Focusing.

                Type: UInt
              '';
            };
            FocusSextractorType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Internal or External Sextractor for Focusing.

                Type: UInt
              '';
            };
            GuideOptionsProfile = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Options Profile for Sextraction when Guiding.

                Type: UInt
              '';
            };
            GuideSextractorType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Internal or External Sextractor for Guiding.

                Type: UInt
              '';
            };
            HFROptionsProfile = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Options Profile for Sextraction to compute subs HFR

                Type: UInt
              '';
            };
            HFRSextractorType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Internal or External Sextractor to compute subs HFR.

                Type: UInt
              '';
            };
            LoggerLevel = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Level of verbosity in the log.

                Type: UInt
              '';
            };
            SolveOptionsProfile = mkOption {
              type = nullOr (either str int);
              default = 3;
              description = ''
                Options Profile for Solving.

                Type: UInt
              '';
            };
            SolveSextractorType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Internal, External, or BuiltIn Sextractor for Solving.

                Type: UInt
              '';
            };
            SolverMode = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Local (0) or Remote (1) solver.

                Type: UInt
              '';
            };
            SolverType = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Local solving method. 0 for Internal Solver. 1 for Local Astrometry. 2 for Local ASTAP. 3 for Online Astrometry.

                Type: UInt
              '';
            };
          };
        };
        default = { };
        description = "StellarSolver";
      };
    "Terrain" = with types;
      mkOption {
        type = submodule {
          options = {
            ShowTerrain = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw terrain

                Type: Bool
              '';
            };
            TerrainDownsampling = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Terrain Downsampling

                Type: Int
              '';
            };
            TerrainPanning = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Terrain While panning.

                Type: Bool
              '';
            };
            TerrainSkipSpeedup = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Terrain Skip Speedup

                Type: Bool
              '';
            };
            TerrainSmoothPixels = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Terrain Smooth Pixels.

                Type: Bool
              '';
            };
            TerrainSource = mkOption {
              type = nullOr str;
              default = "None";
              description = ''
                Terrain Filename.

                Type: String
              '';
            };
            TerrainSourceCorrectAlt = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Terrain Altitude Correction.

                Type: Int
              '';
            };
            TerrainSourceCorrectAz = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Terrain Azimuth Correction.

                Type: Int
              '';
            };
            TerrainTransparencySpeedup = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Terrain Transparency Speedup.

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Terrain";
      };
    "View" = with types;
      mkOption {
        type = submodule {
          options = {
            AsteroidLabelDensity = mkOption {
              type = nullOr (either str float);
              default = 4.0;
              description = ''
                Label density for asteroid names

                Type: Double
              '';
            };
            AutoSelectGrid = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw grids according to active coordinate system?

                Type: Bool
              '';
            };
            BoxBGMode = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                InfoBoxes Background fill mode

                Type: UInt
              '';
            };
            DeepSkyLabelDensity = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Relative density for deep-sky object name labels and/or magnitudes

                Type: Double
              '';
            };
            DeepSkyLongLabels = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show long names in deep-sky object name labels?

                Type: Bool
              '';
            };
            DefaultCursor = mkOption {
              type = nullOr (either str int);
              default = 1;
              description = ''
                Select default Skymap cursor?

                Type: UInt
              '';
            };
            FOVNames = mkOption {
              type = nullOr (either str (listOf str));
              default = "Telrad";
              description = ''
                Name of selected FOV indicators

                Type: StringList
              '';
            };
            FadePlanetTrails = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Fade planet trails to background color?

                Type: Bool
              '';
            };
            FillMilkyWay = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Fill Milky Way contour? (false means use outline only)

                Type: Bool
              '';
            };
            FocusDec = mkOption {
              type = nullOr (either str float);
              default = 45.0;
              description = ''
                Declination of focus position

                Type: Double
              '';
            };
            FocusObject = mkOption {
              type = nullOr str;
              default = "nothing";
              description = ''
                Name of focused object

                Type: String
              '';
            };
            FocusRA = mkOption {
              type = nullOr (either str float);
              default = 180.0;
              description = ''
                Right Ascension of focus position

                Type: Double
              '';
            };
            HideCBounds = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide constellation boundaries while moving?

                Type: Bool
              '';
            };
            HideCLines = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Hide constellation lines while moving?

                Type: Bool
              '';
            };
            HideCNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Hide constellation names while moving?

                Type: Bool
              '';
            };
            HideGrids = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide coordinate grids while moving?

                Type: Bool
              '';
            };
            HideLabels = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide object name labels while moving?

                Type: Bool
              '';
            };
            HideMilkyWay = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide Milky Way contour while moving?

                Type: Bool
              '';
            };
            HideOnSlew = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide objects while moving?

                Type: Bool
              '';
            };
            HideOther = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide extra objects while moving?

                Type: Bool
              '';
            };
            HidePlanets = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Hide solar system objects while moving?

                Type: Bool
              '';
            };
            HideStars = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Hide faint stars while moving?

                Type: Bool
              '';
            };
            IsTracking = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Is tracking engaged?

                Type: Bool
              '';
            };
            LabelFontScaling = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Label font size

                Type: Int
              '';
            };
            LeftClickSelectsObject = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Select objects on left click?

                Type: Bool
              '';
            };
            MagLimitAsteroid = mkOption {
              type = nullOr (either str float);
              default = 15.0;
              description = ''
                Faint limit for asteroids

                Type: Double
              '';
            };
            MagLimitAsteroidDownload = mkOption {
              type = nullOr (either str float);
              default = 12.0;
              description = ''
                Maximum magnitude for asteroids to be downloaded from JPL.

                Type: Double
              '';
            };
            MagLimitDrawDeepSky = mkOption {
              type = nullOr (either str float);
              default = 36.0;
              description = ''
                Faint limit for deep-sky objects

                Type: Double
              '';
            };
            MagLimitDrawDeepSkyZoomOut = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Faint limit for deep-sky objects when zoomed out

                Type: Double
              '';
            };
            MagLimitHideStar = mkOption {
              type = nullOr (either str float);
              default = 5.0;
              description = ''
                Faint limit for stars when slewing

                Type: Double
              '';
            };
            MagnitudeLimitAlertSupernovae = mkOption {
              type = nullOr (either str float);
              default = 13.0;
              description = ''
                Set magnitude limit for supernovae to be alerted

                Type: Double
              '';
            };
            MagnitudeLimitShowSupernovae = mkOption {
              type = nullOr (either str float);
              default = 16.0;
              description = ''
                Set magnitude limit for supernovae to be shown on the skymap

                Type: Double
              '';
            };
            MaxRadCometName = mkOption {
              type = nullOr (either str float);
              default = 1.0;
              description = ''
                Maximum distance from Sun for labeling comets, in AU

                Type: Double
              '';
            };
            OrbitalElementsAutoUpdate = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Update orbital elements for comets and asteroids from online sources on startup.

                Type: Bool
              '';
            };
            Projection = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Mapping projection algorithm

                Type: UInt
              '';
            };
            RunClock = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Run clock

                Type: Bool
              '';
            };
            ShowAsteroidNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Label asteroid names in the sky map?

                Type: Bool
              '';
            };
            ShowAsteroids = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw asteroids in the sky map?

                Type: Bool
              '';
            };
            ShowCBounds = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw constellation boundaries in the sky map?

                Type: Bool
              '';
            };
            ShowCLines = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw constellation lines in the sky map?

                Type: Bool
              '';
            };
            ShowCNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw constellation names in the sky map?

                Type: Bool
              '';
            };
            ShowCometComas = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw comet comas in the sky map?

                Type: Bool
              '';
            };
            ShowCometNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Label comet names in the sky map?

                Type: Bool
              '';
            };
            ShowComets = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw comets in the sky map?

                Type: Bool
              '';
            };
            ShowConstellationArt = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw constellation art in the sky map?

                Type: Bool
              '';
            };
            ShowDeepSky = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw "deep sky" objects in the sky map?

                Type: Bool
              '';
            };
            ShowDeepSkyMagnitudes = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Label deep-sky object magnitudes in the sky map?

                Type: Bool
              '';
            };
            ShowDeepSkyNames = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Label deep-sky objects in the sky map?

                Type: Bool
              '';
            };
            ShowEcliptic = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw ecliptic line in the sky map?

                Type: Bool
              '';
            };
            ShowEquator = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw equator line in the sky map?

                Type: Bool
              '';
            };
            ShowEquatorialGrid = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw equatorial coordinate grid in the sky map?

                Type: Bool
              '';
            };
            ShowFlags = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw flags in the sky map?

                Type: Bool
              '';
            };
            ShowGround = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw opaque ground in the sky map?

                Type: Bool
              '';
            };
            ShowHighlightedCBound = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Highlight the central constellation boundary in the sky map?

                Type: Bool
              '';
            };
            ShowHorizon = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw horizon line in the sky map?

                Type: Bool
              '';
            };
            ShowHorizontalGrid = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw horizontal coordinate grid in the sky map?

                Type: Bool
              '';
            };
            ShowInlineImages = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw inline images for some objects on the sky?

                Type: Bool
              '';
            };
            ShowJupiter = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Jupiter in the sky map?

                Type: Bool
              '';
            };
            ShowLocalMeridian = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw local meridian line in the sky map?

                Type: Bool
              '';
            };
            ShowMars = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Mars in the sky map?

                Type: Bool
              '';
            };
            ShowMercury = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Mercury in the sky map?

                Type: Bool
              '';
            };
            ShowMilkyWay = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Milky Way contour in the sky map?

                Type: Bool
              '';
            };
            ShowMoon = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Moon in the sky map?

                Type: Bool
              '';
            };
            ShowMosaicPanel = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw Mosaic Panel in the sky map?

                Type: Bool
              '';
            };
            ShowNeptune = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Neptune in the sky map?

                Type: Bool
              '';
            };
            ShowOther = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw extra deep-sky objects in the sky map?

                Type: Bool
              '';
            };
            ShowPlanetImages = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw planets as images in the sky map?

                Type: Bool
              '';
            };
            ShowPlanetNames = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Label planet names in the sky map?

                Type: Bool
              '';
            };
            ShowPluto = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Pluto in the sky map?

                Type: Bool
              '';
            };
            ShowSaturn = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Saturn in the sky map?

                Type: Bool
              '';
            };
            ShowSolarSystem = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Meta-option for all planets in the sky map.

                Type: Bool
              '';
            };
            ShowStarMagnitudes = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Label star magnitudes in the sky map?

                Type: Bool
              '';
            };
            ShowStarNames = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Label star names in the sky map?

                Type: Bool
              '';
            };
            ShowStars = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw stars in the sky map?

                Type: Bool
              '';
            };
            ShowSun = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Sun in the sky map?

                Type: Bool
              '';
            };
            ShowSupernovaAlerts = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show supernova alerts?

                Type: Bool
              '';
            };
            ShowSupernovaNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Label Supernova Names in the sky map?

                Type: Bool
              '';
            };
            ShowSupernovae = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Draw supernovae in the sky map?

                Type: Bool
              '';
            };
            ShowUnknownMagObjects = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show deep-sky objects of unknown magnitude

                Type: Bool
              '';
            };
            ShowUranus = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Uranus in the sky map?

                Type: Bool
              '';
            };
            ShowVenus = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw Venus in the sky map?

                Type: Bool
              '';
            };
            SkyCulture = mkOption {
              type = nullOr str;
              default = "Western";
              description = ''
                Sky culture

                Type: String
              '';
            };
            SlewTimeScale = mkOption {
              type = nullOr (either str float);
              default = 60.0;
              description = ''
                Minimum timescale for forced-slewing mode

                Type: Double
              '';
            };
            StarDensity = mkOption {
              type = nullOr (either str int);
              default = 5;
              description = ''
                Density of stars in the field of view

                Type: Int
              '';
            };
            StarLabelDensity = mkOption {
              type = nullOr (either str float);
              default = 2.0;
              description = ''
                Relative density for star name labels and/or magnitudes

                Type: Double
              '';
            };
            UseAbbrevConstellNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use abbreviated constellation names?

                Type: Bool
              '';
            };
            UseAltAz = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use horizontal coordinate system?

                Type: Bool
              '';
            };
            UseAnimatedSlewing = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use animated slewing effects when changing focus position?

                Type: Bool
              '';
            };
            UseAntialias = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use antialiasing when drawing the screen?

                Type: Bool
              '';
            };
            UseAutoLabel = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically label focused object?

                Type: Bool
              '';
            };
            UseAutoTrail = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically add trail to centered solar system body?

                Type: Bool
              '';
            };
            UseGL = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Switch to OpenGL backend

                Type: Bool
              '';
            };
            UseHoverLabel = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Add temporary label on mouse hover?

                Type: Bool
              '';
            };
            UseLatinConstellNames = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use Latin constellation names?

                Type: Bool
              '';
            };
            UseLocalConstellNames = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use localized constellation names?

                Type: Bool
              '';
            };
            UseRefraction = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Correct positions for atmospheric refraction?

                Type: Bool
              '';
            };
            UseRelativistic = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Apply relativistic corrections due to the bending of light in sun's gravitational field

                Type: Bool
              '';
            };
            ZoomFactor = mkOption {
              type = nullOr (either str float);
              default = 250.0;
              description = ''
                Zoom Factor, in pixels per radian

                Type: Double
                Min: 250.
                Max: 5000000.
              '';
            };
            ZoomScrollFactor = mkOption {
              type = nullOr (either str float);
              default = 0.2;
              description = ''
                Zoom scroll sensitivity.

                Type: Double
                Min: 0.01
                Max: 1.0
              '';
            };
          };
        };
        default = { };
        description = "View";
      };
    "WISettings" = with types;
      mkOption {
        type = submodule {
          options = {
            BinocularsAperture = mkOption {
              type = nullOr (either str float);
              default = 40.0;
              description = ''
                Aperture of available binocular

                Type: Double
              '';
            };
            BinocularsCheck = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Availability of binoculars

                Type: Bool
              '';
            };
            BortleClass = mkOption {
              type = nullOr (either str int);
              default = 4;
              description = ''
                Bortle dark-sky rating

                Type: UInt
              '';
            };
            ScopeListIndex = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Index of selected scope from list of scopes

                Type: UInt
              '';
            };
            TelescopeCheck = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Availability of telescope

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "WISettings";
      };
    "Xplanet" = with types;
      mkOption {
        type = submodule {
          options = {
            XplanetAnimationDelay = mkOption {
              type = nullOr (either str int);
              default = 100;
              description = ''
                XPlanet animation delay

                Type: UInt
              '';
            };
            XplanetArcFile = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Arc file

                Type: Bool
              '';
            };
            XplanetArcFilePath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Path to arc file

                Type: String
              '';
            };
            XplanetBackground = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use background

                Type: Bool
              '';
            };
            XplanetBackgroundColor = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use background color

                Type: Bool
              '';
            };
            XplanetBackgroundColorValue = mkOption {
              type = nullOr str;
              default = "#000";
              description = ''
                Background color

                Type: String
              '';
            };
            XplanetBackgroundImage = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use background image

                Type: Bool
              '';
            };
            XplanetBackgroundImagePath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Background image path

                Type: String
              '';
            };
            XplanetColor = mkOption {
              type = nullOr str;
              default = "#F00";
              description = ''
                Label color

                Type: String
              '';
            };
            XplanetConfigFile = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Config file

                Type: Bool
              '';
            };
            XplanetConfigFilePath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Path to config file

                Type: String
              '';
            };
            XplanetDateFormat = mkOption {
              type = nullOr str;
              default = "%c %Z";
              description = ''
                Date format

                Type: String
              '';
            };
            XplanetFOV = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use KStars's FOV

                Type: Bool
              '';
            };
            XplanetFontSize = mkOption {
              type = nullOr str;
              default = "12";
              description = ''
                Font Size

                Type: String
              '';
            };
            XplanetGlare = mkOption {
              type = nullOr str;
              default = "28";
              description = ''
                Sun Glare

                Type: String
              '';
            };
            XplanetHeight = mkOption {
              type = nullOr (either str int);
              default = 480;
              description = ''
                Height of xplanet window

                Type: UInt
              '';
            };
            XplanetLabel = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show label

                Type: Bool
              '';
            };
            XplanetLabelBL = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Bottom left

                Type: Bool
              '';
            };
            XplanetLabelBR = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Bottom right

                Type: Bool
              '';
            };
            XplanetLabelGMT = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Show GMT label

                Type: Bool
              '';
            };
            XplanetLabelLocalTime = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Show GMT label

                Type: Bool
              '';
            };
            XplanetLabelString = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Planet string

                Type: String
              '';
            };
            XplanetLabelTL = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Top left

                Type: Bool
              '';
            };
            XplanetLabelTR = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Top right

                Type: Bool
              '';
            };
            XplanetLatLong = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Latitude-Longitude

                Type: Bool
              '';
            };
            XplanetLatitude = mkOption {
              type = nullOr str;
              default = "0";
              description = ''
                Latitude in degrees

                Type: String
              '';
            };
            XplanetLongitude = mkOption {
              type = nullOr str;
              default = "0";
              description = ''
                Longitude in degrees

                Type: String
              '';
            };
            XplanetMagnitude = mkOption {
              type = nullOr str;
              default = "10";
              description = ''
                Base magnitude

                Type: String
              '';
            };
            XplanetMarkerBounds = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Write marker bounds

                Type: Bool
              '';
            };
            XplanetMarkerBoundsPath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Marker bounds file path

                Type: String
              '';
            };
            XplanetMarkerFile = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use marker file

                Type: Bool
              '';
            };
            XplanetMarkerFilePath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Marker file path

                Type: String
              '';
            };
            XplanetPath = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("XplanetPath")'';
              defaultText = "Code: true";
              description = ''
                Path to xplanet binary

                Type: String
              '';
            };
            XplanetProjection = mkOption {
              type = nullOr (either str int);
              default = 0;
              description = ''
                Projection

                Type: UInt
              '';
            };
            XplanetQuality = mkOption {
              type = nullOr str;
              default = "80";
              description = ''
                Output file quality

                Type: String
              '';
            };
            XplanetRandom = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Random latitude and longitude

                Type: Bool
              '';
            };
            XplanetStarmap = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Star map

                Type: Bool
              '';
            };
            XplanetStarmapPath = mkOption {
              type = nullOr str;
              default = "";
              description = ''
                Star map file path

                Type: String
              '';
            };
            XplanetTimeout = mkOption {
              type = nullOr (either str int);
              default = 1000;
              description = ''
                XPlanet timeout

                Type: UInt
              '';
            };
            XplanetUseFIFO = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use FIFO file

                Type: Bool
              '';
            };
            XplanetWidth = mkOption {
              type = nullOr (either str int);
              default = 640;
              description = ''
                Width of xplanet window

                Type: UInt
              '';
            };
            xplanetIsInternal = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Internal or External XPlanet?

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "Xplanet";
      };
    "indi" = with types;
      mkOption {
        type = submodule {
          options = {
            INDIAOLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Adaptive Optics logging

                Type: Bool
              '';
            };
            INDIAuxiliaryLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Auxiliary logging

                Type: Bool
              '';
            };
            INDICCDLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI CCD logging

                Type: Bool
              '';
            };
            INDIDetectorLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Detector logging

                Type: Bool
              '';
            };
            INDIDomeLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Dome logging

                Type: Bool
              '';
            };
            INDIFilterWheelLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Filter Wheel logging

                Type: Bool
              '';
            };
            INDIFocuserLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Focuser logging

                Type: Bool
              '';
            };
            INDIGPSLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI GPS logging

                Type: Bool
              '';
            };
            INDIHubAgent = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("INDIHubAgent")'';
              defaultText = "Code: true";
              description = ''
                PATH to indihub-agent binary

                Type: String
              '';
            };
            INDIMountLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Mount logging

                Type: Bool
              '';
            };
            INDIRotatorLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Rotator logging

                Type: Bool
              '';
            };
            INDIWeatherLogging = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Enable INDI Weather logging

                Type: Bool
              '';
            };
            INDIWindowHeight = mkOption {
              type = nullOr (either str int);
              default = 600;
              description = ''
                INDI window height

                Type: UInt
              '';
            };
            INDIWindowWidth = mkOption {
              type = nullOr (either str int);
              default = 800;
              description = ''
                INDI window width

                Type: UInt
              '';
            };
            SaveFocusImages = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Save autofocus images on disk?

                Type: Bool
              '';
            };
            fitsDir = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("fitsDir")'';
              defaultText = "Code: true";
              description = ''
                FITS Default directory

                Type: String
              '';
            };
            independentWindowINDI = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Make INDI Control Panel window independent of KStars main window

                Type: Bool
              '';
            };
            indiDriversAreInternal = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Internal or External Astrometry Solver?

                Type: Bool
              '';
            };
            indiDriversDir = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("indiDriversDir")'';
              defaultText = "Code: true";
              description = ''
                PATH to indi drivers directory

                Type: String
              '';
            };
            indiServer = mkOption {
              type = nullOr str;
              default = ''KSUtils::getDefaultPath("indiServer")'';
              defaultText = "Code: true";
              description = ''
                PATH to indiserver binary

                Type: String
              '';
            };
            indiServerIsInternal = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Internal or External INDI Server?

                Type: Bool
              '';
            };
            messageNotificationINDI = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                INDI message notifications

                Type: Bool
              '';
            };
            serverPortEnd = mkOption {
              type = nullOr (either str int);
              default = 8623;
              description = ''
                INDI Server Final Port

                Type: Int
              '';
            };
            serverPortStart = mkOption {
              type = nullOr (either str int);
              default = 7624;
              description = ''
                INDI Server Start Port

                Type: Int
              '';
            };
            serverTransferBufferSize = mkOption {
              type = nullOr (either str int);
              default = 1024;
              description = ''
                INDI Server Transfer Buffer

                Type: Int
              '';
            };
            showINDIMessages = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Display INDI messages in the statusbar?

                Type: Bool
              '';
            };
            showTargetCrosshair = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Draw crosshairs at telescope position in the sky map?

                Type: Bool
              '';
            };
            streamWindowHeight = mkOption {
              type = nullOr (either str int);
              default = 240;
              description = ''
                Video streaming window height

                Type: UInt
              '';
            };
            streamWindowWidth = mkOption {
              type = nullOr (either str int);
              default = 320;
              description = ''
                Video streaming window width

                Type: UInt
              '';
            };
            useGPSSource = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use GPS time and location for synchronization?

                Type: Bool
              '';
            };
            useGeographicUpdate = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically updates geographic location?

                Type: Bool
              '';
            };
            useKStarsSource = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Use KStars time and location for synchronization?

                Type: Bool
              '';
            };
            useMountSource = mkOption {
              type = nullOr (either str bool);
              default = false;
              description = ''
                Use mount time and location for synchronization?

                Type: Bool
              '';
            };
            useTimeUpdate = mkOption {
              type = nullOr (either str bool);
              default = true;
              description = ''
                Automatically updates time and date?

                Type: Bool
              '';
            };
          };
        };
        default = { };
        description = "indi";
      };
  };
  config = mkIf cfg.enable { programs.plasma.files."kstarsrc" = cfg.kstars; };
}
