### Bugs
- Logging out from kde doesn't work sometimes. Not sure if this is related to hyprland though the problems start after it for sure.
- Screensharing doesn't work on KDE when hyprland is also added.
  - probably some shenanigans with `xdg-desktop-portal`

### General
- nixify kde plasma (mainly for keybindings)
- use pkgs.lib.getExe?
- pre-commit formatters

### darwin
- Figure out how to use nixpkgs in mac with spotlight. See https://github.com/nix-darwin/nix-darwin/pull/1396#issuecomment-3150075769

### Hyprland tasks
- screenshotting
- clipboard manager
- blue light filter
- figure out brightnessctl. Mainly for hypridle.
- (nice to have) media control in hypr lock screen
