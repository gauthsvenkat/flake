{
  config,
  pkgs,
  ...
}:
let
  inherit (config.hostCfg) username;
in
{
  home-manager.users.${username} = {
    home.packages = [ pkgs.kdePackages.yakuake ];

    programs.plasma.configFile."yakuakerc" = {
      "Desktop Entry".DefaultProfile = "default.profile";
      Dialogs.FirstRun = false;
      Window.KeepOpen = false;

      Shortcuts = {
        new-session = "Alt+T";
        next-session = "Alt+N";
        next-terminal = "Alt+L";
        previous-session = "Alt+B";
        previous-terminal = "Alt+H";
        split-left-right = "Alt+V";
      };
    };

    xdg.autostart.entries = [
      "${pkgs.kdePackages.yakuake}/share/applications/org.kde.yakuake.desktop"
    ];
  };
}
