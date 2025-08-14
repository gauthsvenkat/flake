{
  system.defaults = {
    NSGlobalDomain = {
      AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";
      AppleShowAllExtensions = true;
      AppleSpacesSwitchOnActivate = false;
      "com.apple.mouse.tapBehavior" = 1;
    };

    dock = {
      magnification = true;
      minimize-to-application = true;
      autohide = true;
      autohide-delay = 0.0;
      persistent-apps = [
        "/System/Applications/Finder.app"
        "/Applications/WezTerm.app"
        "/Applications/Slack.app"
        "/Applications/Firefox.app"
        "/Applications/Thunderbird.app"
        "/Applications/1Password.app"
        # "/Applications/Spotify.app"  # not installed yet
        "/Applications/Visual Studio Code.app"
      ];
      persistent-others = [
        "~" # Home folder
        "~/Downloads" # Downloads folder
        "~/.Trash" # Trash
      ];
    };

    finder = {
      AppleShowAllExtensions = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Recents";
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
    };

    spaces.spans-displays = true;

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };

    WindowManager = {
      EnableTilingByEdgeDrag = true;
      EnableTopTilingByEdgeDrag = true;
      EnableTilingOptionAccelerator = true;
    };
  };
}
