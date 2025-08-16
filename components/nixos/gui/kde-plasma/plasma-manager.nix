{ config, inputs, ... }:
let
  inherit (config.hostCfg) username homeDirectory wallpaper;
in
{
  home-manager.users.${username} = {
    imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

    programs.plasma = {
      enable = true;

      kwin.virtualDesktops = {
        number = 6;
        rows = 2;
      };

      session = {
        general.askForConfirmationOnLogout = true;
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };

      workspace = {
        colorScheme = "BreezeDark";
        lookAndFeel = "org.kde.breezedark.desktop";
        wallpaper = "${homeDirectory}/Pictures/wallpapers/${wallpaper}";
      };
    };
  };
}
